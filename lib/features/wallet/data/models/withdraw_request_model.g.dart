// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawRequestModel _$WithdrawRequestModelFromJson(
  Map<String, dynamic> json,
) => WithdrawRequestModel(
  amount: json['amount'] as num?,
  method: json['method'] as String?,
  accountReference: json['account_reference'] as String?,
);

Map<String, dynamic> _$WithdrawRequestModelToJson(
  WithdrawRequestModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'method': instance.method,
  'account_reference': instance.accountReference,
};
