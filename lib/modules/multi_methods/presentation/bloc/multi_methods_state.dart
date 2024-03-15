part of 'multi_methods_bloc.dart';

abstract class MultiMethodsState extends Equatable {
  const MultiMethodsState();
  @override
  List<Object> get props => [];
}

class MultiMethodsInitial extends MultiMethodsState {}

class OnCreatingMethods extends MultiMethodsState{
  @override
  List<Object> get props => [runtimeType];
}

class OnShowingMethods extends MultiMethodsState{
  final List<List<Entity>> transactions;
  const OnShowingMethods({
    required this.transactions
  });
  @override
  List<Object> get props => transactions;
}