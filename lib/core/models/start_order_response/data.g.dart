// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  activeOrder: json['active_order'] == null
      ? null
      : ActiveOrder.fromJson(json['active_order'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'active_order': instance.activeOrder,
};
