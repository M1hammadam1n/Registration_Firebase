part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}


final class CounterChangeIndexState extends CounterState {
  final int index;
  CounterChangeIndexState(this.index);
}