import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/data_source/app_data_source.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/core/models/empty_response/empty_response.dart';
import 'package:metw_go/core/models/order_action_response/order_action_response.dart';
import 'package:metw_go/core/models/start_order_response/start_order_response.dart';
import 'package:metw_go/core/repo/app_repo.dart';

@Injectable(as: AppRepo)
class AppRepoImpl implements AppRepo {
  final AppDataSource _apiService;
  AppRepoImpl(this._apiService);

  @override
  Future<Either<Failure, EmptyResponse>> logout() async {
    try {
      final response = await _apiService.logout();
      return Right(response);
    } catch (error) {
      // debugPrint(error.toString());
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
  @override
  Future<Either<Failure, EmptyResponse>> deleteAccount() async {
    try {
      final response = await _apiService.deleteAccount();
      return Right(response);
    } catch (error) {
      // debugPrint(error.toString());
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, StartOrderResponse>> acceptStartOrder({
    required int orderId,
  }) async {
    try {
      final response = await _apiService.acceptStartOrder(orderId: orderId);
      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderActionResponse>> arriveAtPickupOrder({
    required int orderId,
  }) async {
    try {
      final response = await _apiService.arriveAtPickupOrder(orderId: orderId);
      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderActionResponse>> confirmPickupOrder({
    required int orderId,
    File? proofPhoto,
    String? signature,
    String? packageCountVerified,
    String? packageConditionVerified,
    String? merchantSignatureObtained,
  }) async {
    try {
      final response = await _apiService.confirmPickupOrder(
        orderId: orderId,
        proofPhoto: proofPhoto,
        signature: signature,
        packageCountVerified: packageCountVerified,
        packageConditionVerified: packageConditionVerified,
        merchantSignatureObtained: merchantSignatureObtained,
      );
      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderActionResponse>> arriveAtDropoffOrder({
    required int orderId,
  }) async {
    try {
      final response = await _apiService.arriveAtDropoffOrder(orderId: orderId);
      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderActionResponse>> completeDeliveryOrder({
    required int orderId,
    File? proofPhoto,
    String? signature,
    String? recipientOtp,
    String? collectedAmount,
    String? deliveryNote,
    String? recipientName,
  }) async {
    try {
      final response = await _apiService.completeDeliveryOrder(
        orderId: orderId,
        proofPhoto: proofPhoto,
        signature: signature,
        recipientOtp: recipientOtp,
        collectedAmount: collectedAmount,
        deliveryNote: deliveryNote,
        recipientName: recipientName,
      );
      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
 
}
