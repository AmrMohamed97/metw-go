import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/const/app_const.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/core/models/auth_model/auth_model.dart';
import 'package:metw_go/core/utils/cache_helper.dart';
import 'package:metw_go/features/register_steps/data/data_source/fifth_step_data_source.dart';
import 'package:metw_go/features/register_steps/data/models/fifth_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:metw_go/features/register_steps/data/repo/fifth_step_repo.dart';

@Injectable(as: FifthStepRepo)
class FifthStepRepoImpl implements FifthStepRepo {
  final FifthStepDataSource dataSource;

  FifthStepRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, FirstStepOutModel>> submitFifthStep(
    FifthStepInputModel input,
  ) async {
    try {
      final response = await dataSource.submitFifthStep(input);
      if (response.data?.registrationToken != null &&
          response.data!.registrationToken!.isNotEmpty) {
        CacheHelper.setSecuerString(
          key: AppConstant.accessToken,
          value: response.data!.registrationToken!,
        );
      }
      CacheHelper.saveAuthData(
        AuthModel(
          isAuthorized: false,
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
