import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';

abstract class VehicleRepo {
  Future<Either<Failure, TransportTypeListResponse>> getTransportTypes();
  Future<Either<Failure, ProfileOutModel>> updateTransport(
    int transportTypeId,
    String plateNumber,
    File? vehicleImage,
  );
}
