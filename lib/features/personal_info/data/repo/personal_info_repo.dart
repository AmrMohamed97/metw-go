import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/personal_info/data/models/update_personal_info_input_model.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';

abstract class PersonalInfoRepo {
  Future<Either<Failure, ProfileOutModel>> updatePersonalInfo(
    UpdatePersonalInfoInputModel inputModel,
  );
}
