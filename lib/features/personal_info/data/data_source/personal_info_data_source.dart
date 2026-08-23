import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/personal_info/data/models/update_personal_info_input_model.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:retrofit/retrofit.dart';

part 'personal_info_data_source.g.dart';

@injectable
@RestApi()
abstract class PersonalInfoDataSource {
  @FactoryMethod()
  factory PersonalInfoDataSource(Dio dio) = _PersonalInfoDataSource;

  @PUT(EndPoints.profileUrl)
  Future<ProfileOutModel> updatePersonalInfo(
    @Body() UpdatePersonalInfoInputModel inputModel,
  );
}
