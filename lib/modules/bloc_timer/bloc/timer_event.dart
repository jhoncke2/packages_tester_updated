part of 'timer_bloc.dart';

sealed class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class AddElement extends TimerEvent{
  final String element;
  const AddElement(this.element);
}

class RemoveLastElement extends TimerEvent{

}