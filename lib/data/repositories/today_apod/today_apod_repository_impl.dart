
import 'package:dartz/dartz.dart';
import 'package:tdd_clean_arch/core/failure.dart';
import 'package:tdd_clean_arch/data/datasources/network/network_info.dart';
import 'package:tdd_clean_arch/data/datasources/today_apod/today_apod_data_source.dart';
import 'package:tdd_clean_arch/domain/entities/apod.dart';
import 'package:tdd_clean_arch/domain/repositories/today_apod/today_apod_repository.dart';

class TodayApodRepositoryImp implements TodayApodRepository{
  final TodayApodDataSource dataSource;
  final NetworkInfo networkInfo;

  TodayApodRepositoryImp({required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Apod>> fetchApodToday() async{
    if(await networkInfo.isConnected) {
      try {
        final model = await dataSource.fetchTodayApod();
        return Right(model);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NoConnection());
    }
  }
  
}