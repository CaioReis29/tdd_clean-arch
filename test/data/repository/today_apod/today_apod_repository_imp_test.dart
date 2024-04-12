import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_clean_arch/core/failure.dart';
import 'package:tdd_clean_arch/data/datasources/network/network_info.dart';
import 'package:tdd_clean_arch/data/datasources/today_apod/today_apod_data_source.dart';
import 'package:tdd_clean_arch/data/repositories/today_apod/today_apod_repository_impl.dart';
import 'package:tdd_clean_arch/domain/entities/apod.dart';

import '../../../test_values.dart';
import 'today_apod_repository_imp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodayApodDataSource>(), MockSpec<NetworkInfo>()])
void main() {
  late MockTodayApodDataSource dataSource;
  late MockNetworkInfo networkInfo;
  late TodayApodRepositoryImp repository;

  setUp(() {
    dataSource = MockTodayApodDataSource();
    networkInfo = MockNetworkInfo();
    repository = TodayApodRepositoryImp(dataSource: dataSource, networkInfo: networkInfo);
  });

  group("func fetchApodToday", () {
    test("Must return an Apod entity to the right side of Either", () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(dataSource.fetchTodayApod()).thenAnswer((_) async => tApodModel());

      final result = await repository.fetchApodToday();

      expect(result, Right<Failure, Apod>(tApodModel()));
    });

    test("Must return an Failure class to the left side of Either coming from de data source", () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(dataSource.fetchTodayApod()).thenThrow(ApiFailure());

      final result = await repository.fetchApodToday();

      expect(result, Left<Failure, Apod>(ApiFailure()));
    });

    test("Must return a connectionless Failure class type", () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.fetchApodToday();

      verifyNever(dataSource.fetchTodayApod());

      expect(result, Left<Failure, Apod>(NoConnection()));
    });

  });
}