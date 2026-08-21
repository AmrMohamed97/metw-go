import 'package:json_annotation/json_annotation.dart';

part 'earnings.g.dart';

@JsonSerializable()
class Earnings {
  String? title;
  String? currency;
  @JsonKey(name: 'net_earnings_label')
  String? netEarningsLabel;
  @JsonKey(name: 'net_earnings')
  num? netEarnings;
  @JsonKey(name: 'order_amount_label')
  String? orderAmountLabel;
  @JsonKey(name: 'order_amount')
  num? orderAmount;
  @JsonKey(name: 'delivery_fee_label')
  String? deliveryFeeLabel;
  @JsonKey(name: 'delivery_fee')
  num? deliveryFee;
  @JsonKey(name: 'commission_label')
  String? commissionLabel;
  @JsonKey(name: 'commission_amount')
  num? commissionAmount;

  Earnings({
    this.title,
    this.currency,
    this.netEarningsLabel,
    this.netEarnings,
    this.orderAmountLabel,
    this.orderAmount,
    this.deliveryFeeLabel,
    this.deliveryFee,
    this.commissionLabel,
    this.commissionAmount,
  });

  factory Earnings.fromJson(Map<String, dynamic> json) {
    return _$EarningsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EarningsToJson(this);
}
