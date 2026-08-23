import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';

abstract class DocumentsRepo {
  Future<Either<Failure, ProfileOutModel>> updateDocuments(
    File? profilePhoto,
    File? nationalIdFront,
    File? nationalIdBack,
    File? drivingLicenseFront,
    File? drivingLicenseBack,
    File? vehicleLicenseFront,
    File? vehicleLicenseBack,
  );
}
