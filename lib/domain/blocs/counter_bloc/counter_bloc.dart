import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterChangeIndexState> {
  CounterBloc() : super(CounterChangeIndexState(0)) {
    on<CounterChangeIndexEvent>((event, emit) {
      emit(CounterChangeIndexState(event.newIndex));
    });
  }
}
