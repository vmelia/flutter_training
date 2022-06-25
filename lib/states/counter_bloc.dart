import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {
  IncrementCounterEvent();
}

class DecrementCounterEvent extends CounterEvent {
  DecrementCounterEvent();
}

class CounterState {
  final int counter;

  CounterState(this.counter);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementCounterEvent>((event, emit) => emit(CounterState(state.counter + 1)));
    on<DecrementCounterEvent>((event, emit) => emit(CounterState(state.counter - 1)));
  }
}
