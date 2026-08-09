import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/login/data/models/login_input_model/login_input_model.dart';
import 'package:metw_go/features/login/data/models/login_out_model/login_out_model.dart';
import 'package:retrofit/retrofit.dart';

part 'login_data_source.g.dart';

@injectable
@RestApi()
abstract class LoginDataSource {
  @FactoryMethod()
  factory LoginDataSource(Dio dio) = _LoginDataSource;


  @POST(EndPoints.loginUrl)
  Future<LoginOutModel> login(@Body() LoginInputModel loginModel);

 
}
