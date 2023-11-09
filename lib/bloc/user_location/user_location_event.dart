part of 'user_location_bloc.dart';

abstract class UserLocationEvent {}

class FetchUserLocation extends UserLocationEvent {
  final User user;

  FetchUserLocation({required this.user});
}
