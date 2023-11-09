import 'package:tracking/utils/importer.dart';

part 'user_location_event.dart';
part 'user_location_state.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  final Location location = Location();
  final UserLocationRepository _userLocationRepository;
  UserLocationBloc(this._userLocationRepository)
      : super(UserLocationInitialState()) {
    on<UserLocationEvent>((event, emit) async {
      if (event is FetchUserLocation) {
        // future.whenComplete(() => emit(...));
        try {
          bool serviceEnabled;
          PermissionStatus permissionGranted;
          // Check if location services are enabled
          serviceEnabled = await location.serviceEnabled();
          if (!serviceEnabled) {
            serviceEnabled = await location.requestService();
            if (!serviceEnabled) {
              throw Exception();
            }
          }

          // Check if location permissions are granted
          permissionGranted = await location.hasPermission();
          if (permissionGranted == PermissionStatus.denied) {
            permissionGranted = await location.requestPermission();
            if (permissionGranted != PermissionStatus.granted) {
              throw Exception();
            }
          }

          // Get the user's current location
          LocationData locationData = await location.getLocation();
          emit(UserLocationChangedState(locationData: locationData));
          // Send the location to Repo
          try {
            await _userLocationRepository.sendCordinate(
                event.user,
                Cordinate(
                  lat: locationData.latitude ?? 0,
                  lon: locationData.longitude ?? 0,
                ));
            print('location updating ....');
          } catch (error) {
            print(error);
          }

          // continue
          location.onLocationChanged.listen(
            (LocationData locationData) {
              add(FetchUserLocation(user: event.user));
            },
          );
        } catch (e) {
          print(e);
          print('Location error!');
          emit(UserLocationErrorState(error: e.toString()));
        }
      }
    });
  }
}
