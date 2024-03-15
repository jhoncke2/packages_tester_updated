import 'package:equatable/equatable.dart';

class MultiMethodsFailure extends Equatable{
  final String message;
  const MultiMethodsFailure(this.message);
  @override
  List<Object?> get props => [message];
}