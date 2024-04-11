
import 'package:dartz/dartz.dart';
import 'package:tdd_clean_arch/core/failure.dart';

abstract class Usecase<R, P> {
  Future<Either<Failure, R>> call(P parameter);
}

class NoParameter{}