import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/const/app_const.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/core/models/auth_model/auth_model.dart';
import 'package:metw_go/core/utils/cache_helper.dart';
import 'package:metw_go/features/register_steps/data/data_source/fourth_step_data_source.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:metw_go/features/register_steps/data/repo/fourth_step_repo.dart';

@Injectable(as: FourthStepRepo)
class FourthStepRepoImpl implements FourthStepRepo {
  final FourthStepDataSource dataSource;

  FourthStepRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, FirstStepOutModel>> submitFourthStep(
    File profilePhoto,
    File nationalIdFront,
    File nationalIdBack,
    File drivingLicenseFront,
    File drivingLicenseBack,
    File vehicleLicenseFront,
    File vehicleLicenseBack,
  ) async {
    try {
      final response = await dataSource.submitFourthStep(
        profilePhoto,
        nationalIdFront,
        nationalIdBack,
        drivingLicenseFront,
        drivingLicenseBack,
        vehicleLicenseFront,
        vehicleLicenseBack,
      );
      CacheHelper.setSecuerString(
        key: AppConstant.accessToken,
        value: response.data?.registrationToken ?? '',
      );
      CacheHelper.saveAuthData(
        AuthModel(
          status: "complete",
          isVerified: true,
          currentStep: response.data?.currentStep,
        ),
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
