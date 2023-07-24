// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cordinate_bloc.dart';

abstract class CordinateState extends Equatable {
  const CordinateState();

  @override
  List<Object> get props => [];
}

class CordinateInitialState extends CordinateState {}

class CordinateUpdatedState extends CordinateState {
  final String statusCode;
  final Cordinate cordinate;
  const CordinateUpdatedState(this.statusCode, this.cordinate);

  @override
  List<Object> get props => [statusCode,cordinate];

  @override
  String toString() {
    return '${cordinate.lat} ${cordinate.lon}';
  }
}

class CordinateErrorState extends CordinateState {
  final String errorMassege;
  const CordinateErrorState(this.errorMassege);

  @override
  List<Object> get props => [errorMassege];
}
