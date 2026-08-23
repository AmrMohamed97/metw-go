import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:retrofit/retrofit.dart';

part 'documents_data_source.g.dart';

@injectable
@RestApi()
abstract class DocumentsDataSource {
  @FactoryMethod()
  factory DocumentsDataSource(Dio dio) = _DocumentsDataSource;

  @POST(EndPoints.profileDocumentsUrl)
  @MultiPart()
  Future<ProfileOutModel> updateDocuments(
    @Part(name: 'profile_photo') File? profilePhoto,
    @Part(name: 'national_id_front') File? nationalIdFront,
    @Part(name: 'national_id_back') File? nationalIdBack,
    @Part(name: 'driving_license_front') File? drivingLicenseFront,
    @Part(name: 'driving_license_back') File? drivingLicenseBack,
    @Part(name: 'vehicle_license_front') File? vehicleLicenseFront,
    @Part(name: 'vehicle_license_back') File? vehicleLicenseBack,
  );
}
