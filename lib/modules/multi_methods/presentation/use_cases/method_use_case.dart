import 'package:dartz/dartz.dart';
import 'package:packages_tester_updated/modules/multi_methods/domain/failures/entity.dart';
import 'package:packages_tester_updated/modules/multi_methods/domain/failures/multi_methods_failures.dart';

abstract class MethodUseCase{
  Future<Either<MultiMethodsFailure, void>> call(Entity entity);
}