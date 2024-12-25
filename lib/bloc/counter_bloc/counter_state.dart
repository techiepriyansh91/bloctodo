import 'dart:ffi';

import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  final String name;
  final bool isSwitchValue;
  final double sliderValue;

  const CounterState(this.count, this.name, this.isSwitchValue,this.sliderValue);

  /// CopyWith method
  CounterState copyWith({int? count, String? name, bool? isSwitchValue,double? sliderValue}) {
    return CounterState(
        count ?? this.count,
        name ?? this.name,
        isSwitchValue ?? this.isSwitchValue,
        sliderValue?? this.sliderValue
    );
  }

  @override
  List<Object?> get props => [count, name, isSwitchValue,sliderValue];
}
