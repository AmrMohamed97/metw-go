import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileOutModel>> getProfile();
}
