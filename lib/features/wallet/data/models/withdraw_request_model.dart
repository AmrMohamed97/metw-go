import 'package:json_annotation/json_annotation.dart';

part 'withdraw_request_model.g.dart';

@JsonSerializable()
class WithdrawRequestModel {
  final num? amount;
  final String? method;
  @JsonKey(name: 'account_reference')
  final String? accountReference;

  WithdrawRequestModel({
    this.amount,
    this.method,
    this.accountReference,
  });

  factory WithdrawRequestModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawRequestModelToJson(this);
}
