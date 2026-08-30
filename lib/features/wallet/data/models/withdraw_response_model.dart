import 'package:json_annotation/json_annotation.dart';

part 'withdraw_response_model.g.dart';

@JsonSerializable()
class WithdrawResponseModel {
  final bool? success;
  final String? message;
  final WithdrawDataModel? data;

  WithdrawResponseModel({this.success, this.message, this.data});

  factory WithdrawResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawResponseModelToJson(this);
}

@JsonSerializable()
class WithdrawDataModel {
  @JsonKey(name: 'withdrawal_id')
  final int? withdrawalId;
  final String? status;

  WithdrawDataModel({this.withdrawalId, this.status});

  factory WithdrawDataModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawDataModelToJson(this);
}
