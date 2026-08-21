import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/models/order_action_response/order_action_response.dart';
import 'package:metw_go/core/models/start_order_response/start_order_response.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:retrofit/retrofit.dart';

part 'app_data_source.g.dart';

@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AppDataSource {
  @FactoryMethod()
  factory AppDataSource(Dio dio) =>
      _AppDataSource(dio, baseUrl: EndPoints.baseUrl);

  // @POST(EndPoints.logoutUrl)
  // Future<EmptyDataResponse> logout();

  @POST(EndPoints.startOrdersUrl)
  Future<StartOrderResponse> acceptStartOrder({
    @Path("order_id") required String orderId,
  });

  @POST(EndPoints.arrivePickupOrdersUrl)
  Future<OrderActionResponse> arriveAtPickupOrder({
    @Path("order_id") required String orderId,
  });

  @POST(EndPoints.confirmationOrdersUrl)
  @MultiPart()
  Future<OrderActionResponse> confirmPickupOrder({
    @Path("order_id") required String orderId,
    @Part(name: 'proof_photo') File? proofPhoto,
    @Part(name: 'signature') String? signature,
    @Part(name: 'checklist[package_count_verified]')
    String? packageCountVerified,
    @Part(name: 'checklist[package_condition_verified]')
    String? packageConditionVerified,
    @Part(name: 'checklist[merchant_signature_obtained]')
    String? merchantSignatureObtained,
  });

  @POST(EndPoints.dropoffOrdersUrl)
  Future<OrderActionResponse> arriveAtDropoffOrder({
    @Path("order_id") required String orderId,
  });

  @POST(EndPoints.completeOrdersUrl)
  @MultiPart()
  Future<OrderActionResponse> completeDeliveryOrder({
    @Path("order_id") required String orderId,
    @Part(name: 'proof_photo') File? proofPhoto,
    @Part(name: 'signature') String? signature,
    @Part(name: 'recipient_otp') String? recipientOtp,
    @Part(name: 'collected_amount') String? collectedAmount,
    @Part(name: 'delivery_note') String? deliveryNote,
    @Part(name: 'recipient_name') String? recipientName,
  });
}
