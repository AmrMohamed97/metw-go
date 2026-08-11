import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';

abstract class FourthStepRepo {
  Future<Either<Failure, FirstStepOutModel>> submitFourthStep(
    File profilePhoto,
    File nationalIdFront,
    File nationalIdBack,
    File drivingLicenseFront,
    File drivingLicenseBack,
    File vehicleLicenseFront,
    File vehicleLicenseBack,
  );
}
