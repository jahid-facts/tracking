part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

// lodding or initial
class UsersInitialState extends UsersState {}

// loaded state
class UsersLoadedState extends UsersState {
  final List<User> users;
  const UsersLoadedState(this.users);

  @override
  List<Object> get props => [users];
}

// error state
class UsersErrorState extends UsersState {
  final String errorMassege;
  const UsersErrorState(this.errorMassege);

  @override
  List<Object> get props => [errorMassege];
}
