// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parcel _$ParcelFromJson(Map<String, dynamic> json) => Parcel(
  description: json['description'] as String?,
  weight: (json['weight'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$ParcelToJson(Parcel instance) => <String, dynamic>{
  'description': instance.description,
  'weight': instance.weight,
  'quantity': instance.quantity,
};
