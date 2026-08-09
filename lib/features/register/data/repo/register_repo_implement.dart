import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/register/data/data_source/register_data_source.dart';
import 'package:metw_go/features/register/data/models/register_input_model/register_input_model.dart';
import 'package:metw_go/features/register/data/models/register_out_model/register_out_model.dart';
import 'package:metw_go/features/register/data/repo/register_repo.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImplement implements RegisterRepo {
  final RegisterDataSource _registerDataSource;

  RegisterRepoImplement(this._registerDataSource);

  @override
  Future<Either<Failure, RegisterOutModel>> createUser(RegisterInputModel createUserModel) async {
    try {
      final response = await _registerDataSource.createUser(createUserModel);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}