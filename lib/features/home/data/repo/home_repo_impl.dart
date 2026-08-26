

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/home/data/data_source/home_data_source.dart';
import 'package:metw_go/features/home/data/models/home_out_model/home_out_model.dart';
import 'package:metw_go/features/home/data/repo/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeDataSource homeDataSource;

  HomeRepoImpl({required this.homeDataSource});

  @override
  Future<Either<Failure, HomeOutModel>> getHomeData() async {
    try {
      final response = await homeDataSource.getHomeData();
      return Right(response);
    } catch (e) {
       if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}