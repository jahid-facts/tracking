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
            // Request to enable location services
            serviceEnabled = await location.requestService();
            if (!serviceEnabled) {
              print('Location service request denied');
              throw Exception('Location service request denied');
            }
          }

          // Check if location permissions are granted
          permissionGranted = await location.hasPermission();
          if (permissionGranted == PermissionStatus.denied) {
            // Request location permissions
            permissionGranted = await location.requestPermission();
            if (permissionGranted != PermissionStatus.granted) {
              print('Location permission request denied');
              throw Exception('Location permission request denied');
            }
          }

          // Get the user's current location
          LocationData locationData = await location.getLocation();
          emit(UserLocationChangedState(locationData: locationData));

          // Send the initial location to the repository
          await _userLocationRepository.sendCordinate(
            event.user,
            Cordinate(
              lat: locationData.latitude ?? 0,
              lon: locationData.longitude ?? 0,
            ),
          );

          // Listen for location changes
          location.onLocationChanged.listen(
            (LocationData locationData) {
              add(FetchUserLocation(user: event.user));
            },
          );
        } catch (e) {
          print('Location error: $e');
          emit(UserLocationErrorState(error: e.toString()));
          add(FetchUserLocation(user: event.user));
        }
      }
    });
  }
}
