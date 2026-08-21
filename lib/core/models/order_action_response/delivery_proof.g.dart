// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_proof.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryProof _$DeliveryProofFromJson(Map<String, dynamic> json) =>
    DeliveryProof(
      title: json['title'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeliveryProofToJson(DeliveryProof instance) =>
    <String, dynamic>{'title': instance.title, 'photos': instance.photos};
