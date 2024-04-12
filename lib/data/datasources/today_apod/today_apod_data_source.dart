import 'package:tdd_clean_arch/data/models/apod_model.dart';

abstract class TodayApodDataSource {
  Future<ApodModel> fetchTodayApod();
}