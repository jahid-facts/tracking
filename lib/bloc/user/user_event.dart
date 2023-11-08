part of 'user_bloc.dart';

abstract class UserEvent {}

class ResetUserEvent extends UserEvent {}

class FetchUserEvent extends UserEvent {
  final String email;
  final String password;
  final String? deviceID;
  FetchUserEvent({
    required this.email,
    required this.password,
    this.deviceID,
  });
}
