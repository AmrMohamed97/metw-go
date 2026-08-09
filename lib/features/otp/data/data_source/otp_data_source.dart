import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/otp/data/models/resend_otp_input_model.dart';
import 'package:metw_go/features/otp/data/models/resend_otp_out_model.dart';
import 'package:metw_go/features/otp/data/models/verify_otp_input_model.dart';
import 'package:metw_go/features/otp/data/models/verify_otp_out_model.dart';
import 'package:retrofit/retrofit.dart';

part 'otp_data_source.g.dart';

@injectable
@RestApi()
abstract class OtpDataSource {
  @factoryMethod
  factory OtpDataSource(Dio dio) = _OtpDataSource;

  @POST(EndPoints.verifyOtpUrl)
  Future<VerifyOtpOutModel> verifyOtp(@Body() VerifyOtpInputModel inputModel);

  @POST(EndPoints.resendOtpUrl)
  Future<ResendOtpOutModel> resendOtp(@Body() ResendOtpInputModel inputModel);
}
