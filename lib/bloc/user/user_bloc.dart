import 'package:tracking/utils/importer.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      if (event is ResetUserEvent) {
        emit(UserInitialState());
      }
      if (event is FetchUserEvent) {
        emit(UserLoadingState());
        try {
          String deviceId = await getDeviceId();
          User user = await _userRepository.getUser(
            email: event.email,
            password: event.password,
            deviceID: deviceId,
          );
          emit(UserLoadedState(user: user));
        } catch (error) {
          emit(UserErrorState(error: error.toString()));
        }
      }
    });
  }
}
