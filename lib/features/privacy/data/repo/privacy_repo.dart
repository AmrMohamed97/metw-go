import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/privacy/data/models/privacy_response.dart';

abstract class PrivacyRepo {
  Future<Either<Failure, PrivacyResponse>> getPrivacy();
}
