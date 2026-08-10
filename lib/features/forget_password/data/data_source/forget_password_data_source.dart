import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/forget_password/data/models/change_password_input_model.dart';
import 'package:metw_go/features/forget_password/data/models/change_password_out_model.dart';
import 'package:metw_go/features/forget_password/data/models/forget_password_input_model.dart';
import 'package:metw_go/features/forget_password/data/models/forget_password_out_model.dart';
import 'package:retrofit/retrofit.dart';

part 'forget_password_data_source.g.dart';

@injectable
@RestApi()
abstract class ForgetPasswordDataSource {
  @factoryMethod
  factory ForgetPasswordDataSource(Dio dio) = _ForgetPasswordDataSource;

  @POST(EndPoints.forgotPasswordSendOtpUrl)
  Future<ForgetPasswordOutModel> sendOtp(@Body() ForgetPasswordInputModel inputModel);

  @POST(EndPoints.changePasswordUrl)
  Future<ChangePasswordOutModel> changePassword(@Body() ChangePasswordInputModel inputModel);
}
