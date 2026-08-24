import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/contact_us/data/data_source/contact_us_data_source.dart';
import 'package:metw_go/features/contact_us/data/models/contact_us_response.dart';
import 'package:metw_go/features/contact_us/data/repo/contact_us_repo.dart';

@Injectable(as: ContactUsRepo)
class ContactUsRepoImpl implements ContactUsRepo {
  final ContactUsDataSource dataSource;

  ContactUsRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, ContactUsResponse>> getContactUs() async {
    try {
      final response = await dataSource.getContactUs();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
