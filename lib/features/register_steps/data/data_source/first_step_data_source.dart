import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:metw_go/features/register_steps/data/models/warehouse_model.dart';
import 'package:retrofit/retrofit.dart';

part 'first_step_data_source.g.dart';

@RestApi()
@injectable
abstract class FirstStepDataSource {
  @factoryMethod
  factory FirstStepDataSource(Dio dio) = _FirstStepDataSource;

  @GET(EndPoints.warehouses)
  Future<WarehouseListResponse> getWarehouses();

  // @GET(EndPoints.transportTypes)
  // Future<TransportTypeListResponse> getTransportTypes();

  @POST(EndPoints.registerStep2)
  Future<FirstStepOutModel> submitFirstStep(
    @Body() FirstStepInputModel input,
  );
}
