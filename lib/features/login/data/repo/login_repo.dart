import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/login/data/models/login_out_model/login_out_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginOutModel>> login({
    required String phone,
    required String password,
  });
}
