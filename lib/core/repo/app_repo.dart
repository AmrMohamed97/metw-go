import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/core/models/empty_data_response.dart';

abstract class AppRepo {
  Future<Either<Failure, EmptyDataResponse>> logout();
}
