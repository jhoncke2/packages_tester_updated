import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:packages_tester_updated/modules/multi_methods/domain/failures/entity.dart';
import 'package:packages_tester_updated/modules/multi_methods/presentation/use_cases/method_use_case.dart';

part 'multi_methods_event.dart';
part 'multi_methods_state.dart';

class MultiMethodsBloc extends Bloc<MultiMethodsEvent, MultiMethodsState> {
  final List<List<Entity>> transactions = [];
  final MethodUseCase method;
  final Random random;
  MultiMethodsBloc({
    required this.method,
    required this.random
  }) : super(MultiMethodsInitial()) {
    on<MultiMethodsEvent>((event, emit)async{
      if(event is InitMethodsTransactionEvent){
        _initMethodsTransaction(emit);
      }else if(event is AddMethodEvent){
        await _addMethod(emit);
      }else if(event is EndMethodsTransactionEvent){
        _endMethodsTransactionEvent(emit);
      }
    });
  }

  void _initMethodsTransaction(Emitter<MultiMethodsState> emit){
    transactions.add([]);
    emit(OnCreatingMethods());
  }

  Future<void> _addMethod(Emitter<MultiMethodsState> emit)async{
    final entity = Entity(id: random.nextInt(99999999), finished: false);
    transactions.last.add(entity);
    await method(entity);
    late int transactionIndex;
    for(int i = 0; i < transactions.length; i++){
      final entityIndex = transactions[i].indexWhere((e) => e.id == entity.id);
      if(entityIndex != -1){
        final currentEntity = transactions[i][entityIndex];
        transactions[i][entityIndex] = Entity(
          id: currentEntity.id,
          finished: true
        );
        transactionIndex = i;
      }
    }
    if(transactions[transactionIndex].every((e) => e.finished)){
      transactions.removeAt(transactionIndex);
    }
    if(state is OnShowingMethods){
      emit(OnShowingMethods(transactions: _getNewTransactionsList()));
    }
  }

  void _endMethodsTransactionEvent(Emitter<MultiMethodsState> emit){
    emit(OnShowingMethods(transactions: _getNewTransactionsList()));
  }

  List<List<Entity>> _getNewTransactionsList() => transactions.map(
    (t) => t.map<Entity>(
      (e) => e
    ).cast<Entity>().toList()
  ).toList();
}
