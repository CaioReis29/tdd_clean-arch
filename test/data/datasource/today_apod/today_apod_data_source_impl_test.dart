import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_clean_arch/core/failure.dart';
import 'package:tdd_clean_arch/data/datasources/today_apod/today_apod_data_source_impl.dart';

import '../../../fixtures/fixtures.dart';
import '../../../test_values.dart';
import '../../mocks/mocks.mocks.dart';

void main() {
  late MockDio dio;
  late TodayApodDataSourceImpl dataSource;

  setUp(() {
    dio = MockDio();
    dataSource = TodayApodDataSourceImpl(dio: dio);
  });
  group("Func Fetch Adpo", () {
    // sucess = apod
    test("should return an apod model", () async {
      when(dio.get(any)).thenAnswer((_) async => Response(requestOptions: RequestOptions(responseType: ResponseType.bytes), data: fixtures("image_response.json"), statusCode: 200));

      final result = await dataSource.fetchTodayApod();

      expect(result, tApodModel());
    });
    // error = status code != 200
    test("must return an ApiFailure exception when status code is different from 200", () async {
      when(dio.get(any)).thenAnswer((_) async => Response(requestOptions: RequestOptions(responseType: ResponseType.bytes), data: fixtures("image_response.json"), statusCode: 500));

      expect(() => dataSource.fetchTodayApod(), throwsA(isA<ApiFailure>()));
    });
    // error 2 = ApiFailure dio Exception
    test("must return an ApiFailure when there is an exception", () async {
      when(dio.get(any)).thenThrow(const SocketException("error"));

      expect(() => dataSource.fetchTodayApod(), throwsA(isA<ApiFailure>()));
    });
  });
}