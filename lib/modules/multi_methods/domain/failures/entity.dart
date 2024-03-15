import 'package:equatable/equatable.dart';

class Entity extends Equatable{
  final int id;
  final bool finished;
  const Entity({
    required this.id,
    required this.finished
  });
  @override
  List<Object?> get props => [id, finished];
}