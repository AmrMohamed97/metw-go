import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/documents/data/data_source/documents_data_source.dart';
import 'package:metw_go/features/documents/data/repo/documents_repo.dart';

@Injectable(as: DocumentsRepo)
class DocumentsRepoImpl implements DocumentsRepo {
  final DocumentsDataSource documentsDataSource;

  DocumentsRepoImpl({required this.documentsDataSource});

  @override
  Future<Either<Failure, ProfileOutModel>> updateDocuments(
    File? profilePhoto,
    File? nationalIdFront,
    File? nationalIdBack,
    File? drivingLicenseFront,
    File? drivingLicenseBack,
    File? vehicleLicenseFront,
    File? vehicleLicenseBack,
  ) async {
    try {
      final response = await documentsDataSource.updateDocuments(
        profilePhoto,
        nationalIdFront,
        nationalIdBack,
        drivingLicenseFront,
        drivingLicenseBack,
        vehicleLicenseFront,
        vehicleLicenseBack,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
