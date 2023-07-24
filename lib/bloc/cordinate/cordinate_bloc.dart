// ignore_for_file: unused_field

import 'package:tracking/utils/importer.dart';

part 'cordinate_event.dart';
part 'cordinate_state.dart';

class CordinateBloc extends Bloc<CordinateEvent, CordinateState> {
  final CordinateRepository _cordinateRepository;
  CordinateBloc(this._cordinateRepository) : super(CordinateInitialState()) {
    on<CordinateEvent>((event, emit) async {
      if (event is UpdateCordinateEvent) {
        try {
          // final String statusCode = await _cordinateRepository.sendCordinate(event.user, event.cord);
          emit(CordinateUpdatedState('statusCode', event.cord));
        } catch (e) {
          emit(CordinateErrorState(e.toString()));
        }
      }
    });
  }
}
