part of 'user_bloc.dart';

abstract class UserEvent {}

class ResetUserEvent extends UserEvent {}

class FetchUserEvent extends UserEvent {
  final String email;
  final String password;
  FetchUserEvent({
    required this.email,
    required this.password,
  });
}
