// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_actions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableActionsModel _$AvailableActionsModelFromJson(
  Map<String, dynamic> json,
) => AvailableActionsModel(
  arrivePickup: json['arrive_pickup'] as bool?,
  confirmPickup: json['confirm_pickup'] as bool?,
  arriveDropoff: json['arrive_dropoff'] as bool?,
  completeDelivery: json['complete_delivery'] as bool?,
);

Map<String, dynamic> _$AvailableActionsModelToJson(
  AvailableActionsModel instance,
) => <String, dynamic>{
  'arrive_pickup': instance.arrivePickup,
  'confirm_pickup': instance.confirmPickup,
  'arrive_dropoff': instance.arriveDropoff,
  'complete_delivery': instance.completeDelivery,
};
