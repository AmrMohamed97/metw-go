import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/register_steps/data/models/fifth_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:retrofit/retrofit.dart';

part 'fifth_step_data_source.g.dart';

@RestApi()
@injectable
abstract class FifthStepDataSource {
  @factoryMethod
  factory FifthStepDataSource(Dio dio) = _FifthStepDataSource;

  @POST(EndPoints.registerStep6)
  Future<FirstStepOutModel> submitFifthStep(@Body() FifthStepInputModel input);
}
