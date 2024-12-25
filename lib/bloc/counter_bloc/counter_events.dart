import 'package:blocstatemanagement/bloc/counter_bloc/counter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class ChangeName extends CounterEvent {}

class SwitchChange extends CounterEvent {}

class SliderValueEvent extends CounterEvent {
  double sliderValue;
  SliderValueEvent({required this.sliderValue});
  @override
  List<Object?> get props => [sliderValue];
}
