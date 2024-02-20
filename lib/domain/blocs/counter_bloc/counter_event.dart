part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}


class CounterChangeIndexEvent  extends CounterEvent{
  final int newIndex;
  
  CounterChangeIndexEvent(this.newIndex);
}