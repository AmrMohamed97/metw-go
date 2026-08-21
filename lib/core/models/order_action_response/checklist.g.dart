// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checklist _$ChecklistFromJson(Map<String, dynamic> json) => Checklist(
  packageCountVerified: json['package_count_verified'] as String?,
  packageConditionVerified: json['package_condition_verified'] as String?,
  merchantSignatureObtained: json['merchant_signature_obtained'] as String?,
);

Map<String, dynamic> _$ChecklistToJson(Checklist instance) => <String, dynamic>{
  'package_count_verified': instance.packageCountVerified,
  'package_condition_verified': instance.packageConditionVerified,
  'merchant_signature_obtained': instance.merchantSignatureObtained,
};
