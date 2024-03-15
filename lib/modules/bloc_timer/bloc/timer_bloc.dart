import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const _secondsToNewRemove = 7;
  TimerBloc() :
    super(const TimerState(
      items: [],
      secondsToRemove: 0,
      canRemove: true
    )) {
    on<TimerEvent>((event, emit)async{
      if(event is AddElement){
        final initState = state;
        final updatedItems = List<String>.from(initState.items);
        updatedItems.add(event.element);
        emit(TimerState(
          items: updatedItems,
          secondsToRemove: initState.secondsToRemove,
          canRemove: initState.canRemove
        ));
      }else if(event is RemoveLastElement){
        final initState = state;
        final initItems = initState.items;
        if(initItems.isNotEmpty){
          final updatedItems = List<String>.from(initItems);
          updatedItems.removeLast();
          emit(TimerState(
            items: updatedItems,
            secondsToRemove: _secondsToNewRemove,
            canRemove: false
          ));
          await _timeForNextRemoval(emit);
        }
      }
    });
  }

  Future<void> _timeForNextRemoval(Emitter<TimerState> emit)async{
    final initState = state;
    int seconds = _secondsToNewRemove;
    while(seconds > 0){
      await Future.delayed(const Duration(seconds: 1));
      seconds--;
      emit(TimerState(
        items: initState.items,
        secondsToRemove: seconds,
        canRemove: false
      ));
    }
    emit(TimerState(
      items: initState.items,
      secondsToRemove: seconds,
      canRemove: true
    ));
  }
}
