import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/const/app_const.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/core/models/auth_model/auth_model.dart';
import 'package:metw_go/core/notifications/notification_handler.dart';
import 'package:metw_go/core/utils/cache_helper.dart';
import 'package:metw_go/features/login/data/data_source/login_data_source.dart';
import 'package:metw_go/features/login/data/models/login_input_model/login_input_model.dart';
import 'package:metw_go/features/login/data/models/login_out_model/login_out_model.dart';
import 'package:metw_go/features/login/data/repo/login_repo.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginDataSource loginDataSource;

  LoginRepoImpl({required this.loginDataSource});

  @override
  Future<Either<Failure, LoginOutModel>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final result = await loginDataSource.login(
        LoginInputModel(
          phone: phone,
          password: password,
          deviceToken: NotificationHandler.fcmToken,
        ),
      );
      await CacheHelper.saveAuthData(
        AuthModel(
          status: result.data?.status,
          isVerified: result.data?.isVerified,
          currentStep: result.data?.registrationProgress?.currentStep,
        ),
      );
      CacheHelper.setSecuerString(
        key: AppConstant.accessToken,
        value: result.data?.accessToken ?? '',
      );
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
