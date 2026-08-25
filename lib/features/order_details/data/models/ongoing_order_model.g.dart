// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ongoing_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OngoingOrderModel _$OngoingOrderModelFromJson(Map<String, dynamic> json) =>
    OngoingOrderModel(
      mode: json['mode'] as String?,
      headerNote: json['header_note'] as String?,
      contactName: json['contact_name'] as String?,
      contactPhone: json['contact_phone'] as String?,
      locationTitle: json['location_title'] as String?,
      locationAddress: json['location_address'] as String?,
      locationCity: json['location_city'] as String?,
      locationCountry: json['location_country'] as String?,
      dropoffTitle: json['dropoff_title'] as String?,
      dropoffAddress: json['dropoff_address'] as String?,
      dropoffCity: json['dropoff_city'] as String?,
      dropoffCountry: json['dropoff_country'] as String?,
      pickupTitle: json['pickup_title'] as String?,
      pickupAddress: json['pickup_address'] as String?,
      pickupCity: json['pickup_city'] as String?,
      detailsTitle: json['details_title'] as String?,
      packageDescription: json['package_description'] as String?,
      weightLabel: json['weight_label'] as String?,
      paymentMethodLabel: json['payment_method_label'] as String?,
      orderTotalLabel: json['order_total_label'] as String?,
      deliveryFeeLabel: json['delivery_fee_label'] as String?,
      arrivalHint: json['arrival_hint'] as String?,
      primaryActionLabel: json['primary_action_label'] as String?,
    );

Map<String, dynamic> _$OngoingOrderModelToJson(OngoingOrderModel instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'header_note': instance.headerNote,
      'contact_name': instance.contactName,
      'contact_phone': instance.contactPhone,
      'location_title': instance.locationTitle,
      'location_address': instance.locationAddress,
      'location_city': instance.locationCity,
      'location_country': instance.locationCountry,
      'dropoff_title': instance.dropoffTitle,
      'dropoff_address': instance.dropoffAddress,
      'dropoff_city': instance.dropoffCity,
      'dropoff_country': instance.dropoffCountry,
      'pickup_title': instance.pickupTitle,
      'pickup_address': instance.pickupAddress,
      'pickup_city': instance.pickupCity,
      'details_title': instance.detailsTitle,
      'package_description': instance.packageDescription,
      'weight_label': instance.weightLabel,
      'payment_method_label': instance.paymentMethodLabel,
      'order_total_label': instance.orderTotalLabel,
      'delivery_fee_label': instance.deliveryFeeLabel,
      'arrival_hint': instance.arrivalHint,
      'primary_action_label': instance.primaryActionLabel,
    };
