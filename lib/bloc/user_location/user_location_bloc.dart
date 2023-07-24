import 'package:tracking/utils/importer.dart';

part 'user_location_event.dart';
part 'user_location_state.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  final Location location = Location();
  UserLocationBloc() : super(UserLocationInitialState()) {
    on<UserLocationEvent>((event, emit) async {
      if (event is FetchLocation) {
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
          emit(
            UserLocationChangedState(
                locationData: await location.getLocation()),
          );
          location.onLocationChanged.listen(
            (LocationData locationData) {
              add(FetchLocation());
            },
          );
        } catch (e) {
          emit(UserLocationErrorState(error: e.toString()));
        }
      }
    });
  }
}
