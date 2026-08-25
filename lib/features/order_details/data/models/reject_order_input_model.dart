import 'package:json_annotation/json_annotation.dart';

part 'reject_order_input_model.g.dart';

@JsonSerializable()
class RejectOrderInputModel {
  @JsonKey(name: 'reason_id')
  final int? reasonId;
  @JsonKey(name: 'custom_reason')
  final String? customReason;

  RejectOrderInputModel({this.reasonId, this.customReason});

  factory RejectOrderInputModel.fromJson(Map<String, dynamic> json) =>
      _$RejectOrderInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$RejectOrderInputModelToJson(this);
}
