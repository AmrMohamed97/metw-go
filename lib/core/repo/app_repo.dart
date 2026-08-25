import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/core/models/empty_response/empty_response.dart';
import 'package:metw_go/core/models/order_action_response/order_action_response.dart';
import 'package:metw_go/core/models/start_order_response/start_order_response.dart';

abstract class AppRepo {
  Future<Either<Failure, EmptyResponse>> logout();
  Future<Either<Failure, EmptyResponse>> deleteAccount();

  Future<Either<Failure, StartOrderResponse>> acceptStartOrder({
    required int orderId,
  });

  Future<Either<Failure, OrderActionResponse>> arriveAtPickupOrder({
    required int orderId,
  });

  Future<Either<Failure, OrderActionResponse>> confirmPickupOrder({
    required int orderId,
    File? proofPhoto,
    String? signature,
    String? packageCountVerified,
    String? packageConditionVerified,
    String? merchantSignatureObtained,
  });

  Future<Either<Failure, OrderActionResponse>> arriveAtDropoffOrder({
    required int orderId,
  });

  Future<Either<Failure, OrderActionResponse>> completeDeliveryOrder({
    required int orderId,
    File? proofPhoto,
    String? signature,
    String? recipientOtp,
    String? collectedAmount,
    String? deliveryNote,
    String? recipientName,
  });
}
