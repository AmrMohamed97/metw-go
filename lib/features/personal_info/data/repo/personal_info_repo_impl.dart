import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/personal_info/data/data_source/personal_info_data_source.dart';
import 'package:metw_go/features/personal_info/data/models/update_personal_info_input_model.dart';
import 'package:metw_go/features/personal_info/data/repo/personal_info_repo.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';

@Injectable(as: PersonalInfoRepo)
class PersonalInfoRepoImpl implements PersonalInfoRepo {
  final PersonalInfoDataSource personalInfoDataSource;

  PersonalInfoRepoImpl({required this.personalInfoDataSource});

  @override
  Future<Either<Failure, ProfileOutModel>> updatePersonalInfo(
    UpdatePersonalInfoInputModel inputModel,
  ) async {
    try {
      final response = await personalInfoDataSource.updatePersonalInfo(
        inputModel,
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
