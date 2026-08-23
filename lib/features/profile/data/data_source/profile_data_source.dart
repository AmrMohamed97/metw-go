
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_data_source.g.dart';

@injectable
@RestApi()
abstract class ProfileDataSource {
  @FactoryMethod()
  factory ProfileDataSource(Dio dio) = _ProfileDataSource;

  @GET(EndPoints.profileUrl)
  Future<ProfileOutModel> getProfile();
}
