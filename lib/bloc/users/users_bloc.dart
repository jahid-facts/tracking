import 'package:tracking/utils/importer.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository _usersRepository;
  UsersBloc(this._usersRepository) : super(UsersInitialState()) {
    on<UsersEvent>((event, emit) async {
      emit(UsersInitialState());
      try {
        final users = await _usersRepository.getUser();
        emit(UsersLoadedState(users));
      } catch (e) {
        emit(UsersErrorState(e.toString()));
      }
    });
  }
}
