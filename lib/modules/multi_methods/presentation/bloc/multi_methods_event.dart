part of 'multi_methods_bloc.dart';

abstract class MultiMethodsEvent extends Equatable {
  const MultiMethodsEvent();

  @override
  List<Object> get props => [];
}

class InitMethodsTransactionEvent extends MultiMethodsEvent{

}

class AddMethodEvent extends MultiMethodsEvent{

}

class EndMethodsTransactionEvent extends MultiMethodsEvent{

}
