import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_events.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0, "initial value",true,0.5)) {
    on<IncrementEvent>((event, emit) {
      emit(state.copyWith(
        count: state.count + 1,
      ));
    });

    on<DecrementEvent>((event, emit) {
      emit(state.copyWith(
        count: state.count - 1,
      ));
    });
    on<ChangeName>((event, emit) {
      emit(state.copyWith(
       name: "priyanshu"
      ));
    });
    on<SwitchChange>((event, emit) {
      emit(state.copyWith(
       isSwitchValue: !state.isSwitchValue
      ));
    });

    on<SliderValueEvent>((event, emit) {
      emit(state.copyWith(
          sliderValue: event.sliderValue
      ));
      print("sliderValue:${state.sliderValue}");
    });
  }
}





