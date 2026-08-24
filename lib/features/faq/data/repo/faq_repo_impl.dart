import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/faq/data/data_source/faq_data_source.dart';
import 'package:metw_go/features/faq/data/models/faq_response.dart';
import 'package:metw_go/features/faq/data/repo/faq_repo.dart';

@Injectable(as: FaqRepo)
class FaqRepoImpl implements FaqRepo {
  final FaqDataSource dataSource;

  FaqRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, FaqResponse>> getFaq() async {
    try {
      final response = await dataSource.getFaq();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
