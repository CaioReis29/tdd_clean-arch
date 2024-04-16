import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_clean_arch/core/failure.dart';
import 'package:tdd_clean_arch/domain/usecases/today_apod/fetch_apod_today.dart';
import 'package:tdd_clean_arch/presentation/blocs/today_apod/today_apod_bloc.dart';

import '../../test_values.dart';
import 'today_apod_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchApodToday>()])
void main() {
  late MockFetchApodToday fetchApodToday;
  late TodayApodBloc bloc;

  setUp(() {
    fetchApodToday = MockFetchApodToday();
    bloc = TodayApodBloc(fetchApodToday: fetchApodToday);
  });

  group("usecase - fetchTodayApod", () {
    test("must emit LoadingState and SuccessState afterwards", () {
      when(fetchApodToday(any)).thenAnswer((_) async => Right(tApod()));

      bloc.input.add(FetchApodTodayEvent());

      expect(bloc.stream, emitsInOrder([LoadingTodayApodState(), SucessTodayApodState(apod: tApod())]));
    });

    test("must emit LoadingState and ErrorState afterwards", () async {
      when(fetchApodToday(any)).thenAnswer((_) async => Left(NoConnection()));

      bloc.input.add(FetchApodTodayEvent());

      expect(bloc.stream, emitsInOrder([LoadingTodayApodState(), ErrorTodayApodState(msg: noConnection().msg)]));
    });
  });
}