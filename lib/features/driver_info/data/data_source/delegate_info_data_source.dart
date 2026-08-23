import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/driver_info/data/models/update_work_info_input_model.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/warehouse_model.dart';
import 'package:retrofit/retrofit.dart';

part 'delegate_info_data_source.g.dart';

@injectable
@RestApi()
abstract class DelegateInfoDataSource {
  @FactoryMethod()
  factory DelegateInfoDataSource(Dio dio) = _DelegateInfoDataSource;

  @PUT(EndPoints.profileWorkInfoUrl)
  Future<ProfileOutModel> updateWorkInfo(
    @Body() UpdateWorkInfoInputModel inputModel,
  );

  @GET(EndPoints.warehouses)
  Future<WarehouseListResponse> getWarehouses();
}
