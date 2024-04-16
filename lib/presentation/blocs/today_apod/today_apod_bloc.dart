import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:tdd_clean_arch/domain/entities/apod.dart';
import 'package:tdd_clean_arch/domain/usecases/core/usecase.dart';
import 'package:tdd_clean_arch/domain/usecases/today_apod/fetch_apod_today.dart';

part 'today_apod_event.dart';
part 'today_apod_state.dart';


class TodayApodBloc {
  FetchApodToday fetchApodToday;

  TodayApodBloc({required this.fetchApodToday}) {
    _inputController.stream.listen(_blocEventController);
  }

  final StreamController<TodayApodEvent> _inputController = StreamController<TodayApodEvent>();

  final StreamController<TodayApodState> _outputController = StreamController<TodayApodState>();

  Sink<TodayApodEvent> get input => _inputController.sink;

  Stream<TodayApodState> get stream => _outputController.stream;

  void _blocEventController(TodayApodEvent event) {
    _outputController.add(LoadingTodayApodState());
    if (event is FetchApodTodayEvent) {
      fetchApodToday(NoParameter()).then((either) => either.fold(
        (l) => _outputController.add(ErrorTodayApodState(msg: l.msg)), 
        (r) => _outputController.add(SucessTodayApodState(apod: r))),
      );
    }
  }
}