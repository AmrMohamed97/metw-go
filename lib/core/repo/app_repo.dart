import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/core/models/order_action_response/order_action_response.dart';
import 'package:metw_go/core/models/start_order_response/start_order_response.dart';

abstract class AppRepo {
  // Future<Either<Failure, EmptyDataResponse>> logout();

  Future<Either<Failure, StartOrderResponse>> acceptStartOrder({
    required String orderId,
  });

  Future<Either<Failure, OrderActionResponse>> arriveAtPickupOrder({
    required String orderId,
  });

  Future<Either<Failure, OrderActionResponse>> confirmPickupOrder({
    required String orderId,
    File? proofPhoto,
    String? signature,
    String? packageCountVerified,
    String? packageConditionVerified,
    String? merchantSignatureObtained,
  });

  Future<Either<Failure, OrderActionResponse>> arriveAtDropoffOrder({
    required String orderId,
  });

  Future<Either<Failure, OrderActionResponse>> completeDeliveryOrder({
    required String orderId,
    File? proofPhoto,
    String? signature,
    String? recipientOtp,
    String? collectedAmount,
    String? deliveryNote,
    String? recipientName,
  });
}
