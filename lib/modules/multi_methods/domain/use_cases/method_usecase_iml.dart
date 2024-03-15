import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:packages_tester_updated/modules/multi_methods/domain/failures/entity.dart';
import 'package:packages_tester_updated/modules/multi_methods/domain/failures/multi_methods_failures.dart';
import 'package:packages_tester_updated/modules/multi_methods/presentation/use_cases/method_use_case.dart';

class MethodUseCaseImpl implements MethodUseCase{
  static const minSeconds = 2;
  static const maxExtraSeconds = 5;
  final Random random;
  MethodUseCaseImpl({
    required this.random
  });
  @override
  Future<Either<MultiMethodsFailure, void>> call(Entity entity)async{
    final seconds = minSeconds + random.nextInt(maxExtraSeconds);
    await Future.delayed(Duration(seconds: seconds), (){});
    return const Right(null);
  }
}