import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/privacy/data/data_source/privacy_data_source.dart';
import 'package:metw_go/features/privacy/data/models/privacy_response.dart';
import 'package:metw_go/features/privacy/data/repo/privacy_repo.dart';

@Injectable(as: PrivacyRepo)
class PrivacyRepoImpl implements PrivacyRepo {
  final PrivacyDataSource dataSource;

  PrivacyRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, PrivacyResponse>> getPrivacy() async {
    try {
      final response = await dataSource.getPrivacy();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
