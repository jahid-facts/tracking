import 'package:tracking/utils/importer.dart';

part 'shops_event.dart';
part 'shops_state.dart';

class ShopsBloc extends Bloc<ShopsEvent, ShopsState> {
  final ShopsRepository _shopsRepository;
  ShopsBloc(this._shopsRepository) : super(ShopsInitialState()) {
    on<ShopsEvent>((event, emit) async {
      emit(ShopsInitialState());
      if (event is LoadShopsEvent) {
        try {
          final shops = await _shopsRepository.getShops(
              userId: event.userId, date: event.date);
          emit(ShopsLoadedState(shops));
        } catch (e) {
          emit(ShopsErrorState(e.toString()));
        }
      }
    });
  }
}
