import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/core/notifications/notification_handler.dart';
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
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
