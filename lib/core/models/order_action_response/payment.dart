import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  String? title;
  @JsonKey(name: 'status_label')
  String? statusLabel;
  @JsonKey(name: 'required_amount_label')
  String? requiredAmountLabel;
  @JsonKey(name: 'required_amount')
  num? requiredAmount;
  @JsonKey(name: 'collected_amount_label')
  String? collectedAmountLabel;
  @JsonKey(name: 'collected_amount')
  num? collectedAmount;
  @JsonKey(name: 'remaining_amount_label')
  String? remainingAmountLabel;
  @JsonKey(name: 'remaining_amount')
  num? remainingAmount;
  String? currency;

  Payment({
    this.title,
    this.statusLabel,
    this.requiredAmountLabel,
    this.requiredAmount,
    this.collectedAmountLabel,
    this.collectedAmount,
    this.remainingAmountLabel,
    this.remainingAmount,
    this.currency,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return _$PaymentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
