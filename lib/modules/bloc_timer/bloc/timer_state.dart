part of 'timer_bloc.dart';

class TimerState{
  final List<String> items;
  final int secondsToRemove;
  final bool canRemove;
  const TimerState({
    required this.items,
    required this.secondsToRemove,
    required this.canRemove
  });
}
