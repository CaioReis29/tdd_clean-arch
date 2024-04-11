
import 'package:dartz/dartz.dart';
import 'package:tdd_clean_arch/core/failure.dart';
import 'package:tdd_clean_arch/domain/entities/apod.dart';
import 'package:tdd_clean_arch/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:tdd_clean_arch/domain/usecases/core/usecase.dart';

class FetchApodToday extends Usecase<Apod, NoParameter> {
  final TodayApodRepository repository;

  FetchApodToday({required this.repository});

  @override
  Future<Either<Failure, Apod>> call(NoParameter parameter) async => await repository.fetchApodToday();
}