import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/data_source/app_data_source.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/core/models/empty_data_response.dart';
import 'package:metw_go/core/repo/app_repo.dart';

@Injectable(as: AppRepo)
class AppRepoImpl implements AppRepo {
  final AppDataSource _apiService;
  AppRepoImpl(this._apiService);
  @override
  Future<Either<Failure, EmptyDataResponse>> logout() async {
    try {
      final response = await _apiService.logout();
      return Right(response);
    } catch (error) {
      // debugPrint(error.toString());
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
