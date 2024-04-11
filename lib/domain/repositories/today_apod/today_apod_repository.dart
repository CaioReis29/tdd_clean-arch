import 'package:dartz/dartz.dart';
import 'package:tdd_clean_arch/core/failure.dart';
import 'package:tdd_clean_arch/domain/entities/apod.dart';

abstract class TodayApodRepository {
  Future<Either<Failure, Apod>>fetchApodToday();
}