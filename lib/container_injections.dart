import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tdd_clean_arch/data/datasources/network/network_info.dart';
import 'package:tdd_clean_arch/data/datasources/today_apod/today_apod_data_source.dart';
import 'package:tdd_clean_arch/data/datasources/today_apod/today_apod_data_source_impl.dart';
import 'package:tdd_clean_arch/data/repositories/today_apod/today_apod_repository_impl.dart';
import 'package:tdd_clean_arch/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:tdd_clean_arch/domain/usecases/today_apod/fetch_apod_today.dart';
import 'package:tdd_clean_arch/presentation/blocs/today_apod/today_apod_bloc.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpContainer() async {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetChecker: getIt<InternetConnectionChecker>()));

  apodToday();
}

void apodToday() {
  getIt.registerLazySingleton<TodayApodDataSource>(() => TodayApodDataSourceImpl(dio: getIt<Dio>()));

  getIt.registerLazySingleton<TodayApodRepository>(() => TodayApodRepositoryImp(dataSource: getIt<TodayApodDataSource>(), networkInfo: getIt<NetworkInfo>()));

  getIt.registerLazySingleton<FetchApodToday>(() => FetchApodToday(repository: getIt<TodayApodRepository>()));

  getIt.registerFactory(() => TodayApodBloc(fetchApodToday: getIt<FetchApodToday>()));
}