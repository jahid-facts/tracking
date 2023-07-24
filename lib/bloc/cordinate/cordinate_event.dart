
part of 'cordinate_bloc.dart';

abstract class CordinateEvent extends Equatable {
  const CordinateEvent();

  @override
  List<Object> get props => [];
}
class UpdateCordinateEvent extends CordinateEvent {
  final User user; 
  final Cordinate cord;
  const UpdateCordinateEvent({
    required this.user,
    required this.cord,
  });
}
