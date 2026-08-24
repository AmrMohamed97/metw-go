import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/faq/data/models/faq_response.dart';

abstract class FaqRepo {
  Future<Either<Failure, FaqResponse>> getFaq();
}
