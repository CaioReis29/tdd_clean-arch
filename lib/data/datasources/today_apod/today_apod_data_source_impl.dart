
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tdd_clean_arch/core/failure.dart';
import 'package:tdd_clean_arch/data/datasources/today_apod/today_apod_data_source.dart';
import 'package:tdd_clean_arch/data/models/apod_model.dart';
import 'package:tdd_clean_arch/environment.dart';

class TodayApodDataSourceImpl implements TodayApodDataSource{

  final Dio dio;

  TodayApodDataSourceImpl({required this.dio});

  @override
  Future<ApodModel> fetchTodayApod() async{
    Response response;
    try {
      response = await dio.get(Environment.baseUrl);
    } catch (failure) {
      throw ApiFailure();
    }

    if(response.statusCode == 200) {
      final json = jsonDecode(response.data);
      return ApodModel.fromJson(json);
    } else {
      throw ApiFailure();
    }
  }
  
}