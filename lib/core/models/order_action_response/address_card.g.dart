// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressCard _$AddressCardFromJson(Map<String, dynamic> json) => AddressCard(
  title: json['title'] as String?,
  address: json['address'] as String?,
  city: json['city'],
  country: json['country'] as String?,
);

Map<String, dynamic> _$AddressCardToJson(AddressCard instance) =>
    <String, dynamic>{
      'title': instance.title,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
    };
