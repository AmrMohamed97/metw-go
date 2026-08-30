// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawResponseModel _$WithdrawResponseModelFromJson(
  Map<String, dynamic> json,
) => WithdrawResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : WithdrawDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WithdrawResponseModelToJson(
  WithdrawResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

WithdrawDataModel _$WithdrawDataModelFromJson(Map<String, dynamic> json) =>
    WithdrawDataModel(
      withdrawalId: (json['withdrawal_id'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$WithdrawDataModelToJson(WithdrawDataModel instance) =>
    <String, dynamic>{
      'withdrawal_id': instance.withdrawalId,
      'status': instance.status,
    };
