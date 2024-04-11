import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_clean_arch/core/failure.dart';
import 'package:tdd_clean_arch/domain/entities/apod.dart';
import 'package:tdd_clean_arch/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:tdd_clean_arch/domain/usecases/core/usecase.dart';
import 'package:tdd_clean_arch/domain/usecases/today_apod/fetch_apod_today.dart';

import '../../../test_values.dart';
import 'fetch_apod_today_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodayApodRepository>()])

void main() {
  late MockTodayApodRepository repository;
  late FetchApodToday usecase;

  setUp(() {
    repository = MockTodayApodRepository();
    usecase = FetchApodToday(repository: repository);
  });

  // return apod
  test("Must return an Apod entity to the right side of Either", () async{
    when(repository.fetchApodToday())
    .thenAnswer((_) async => Right<Failure, Apod>(tApod()));

    final result = await usecase(NoParameter());

    expect(result, Right<Failure, Apod>(tApod()));
  });
  // return failure
  test("Must return an Failure Class to the left side of Either", () async {
    when(repository.fetchApodToday())
    .thenAnswer((_) async => Left<Failure, Apod>(noConnection()));

    final result = await usecase(NoParameter());

    expect(result, Left<Failure, Apod>(noConnection()));
  });
}