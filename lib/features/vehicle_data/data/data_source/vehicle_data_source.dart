import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:retrofit/retrofit.dart';

part 'vehicle_data_source.g.dart';

@injectable
@RestApi()
abstract class VehicleDataSource {
  @FactoryMethod()
  factory VehicleDataSource(Dio dio) = _VehicleDataSource;

  @GET(EndPoints.transportTypes)
  Future<TransportTypeListResponse> getTransportTypes();

  @PUT(EndPoints.profileTransportUrl)
  @MultiPart()
  Future<ProfileOutModel> updateTransport(
    @Part(name: 'transport_type_id') int transportTypeId,
    @Part(name: 'plate_number') String plateNumber,
    @Part(name: 'vehicle_image') File? vehicleImage,
  );
}
