import 'package:bloc_test/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_test/bloc/color_bloc/color_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ColorBloc extends Bloc<CounterEvent, ColorState> {
  ColorBloc() : super(ColorInitialState()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(ColorIncrementState(Colors.green));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(ColorDecrementState(Colors.red));
    });
  }
}
