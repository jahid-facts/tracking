part of 'shops_bloc.dart';

abstract class ShopsEvent extends Equatable {
  const ShopsEvent();

  @override
  List<Object> get props => [];
}

class LoadShopsEvent extends ShopsEvent {
  final int userId;
  final String date;

  const LoadShopsEvent({required this.userId, required this.date});

  @override
  List<Object> get props => [userId, date];
}
