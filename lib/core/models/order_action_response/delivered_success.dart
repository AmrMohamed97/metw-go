import 'package:json_annotation/json_annotation.dart';

part 'delivered_success.g.dart';

@JsonSerializable()
class DeliveredSuccess {
  String? title;
  String? subtitle;
  String? badge;
  @JsonKey(name: 'earnings_title')
  String? earningsTitle;
  @JsonKey(name: 'earnings_amount')
  num? earningsAmount;
  String? currency;
  @JsonKey(name: 'order_reference')
  String? orderReference;
  @JsonKey(name: 'delivered_at')
  String? deliveredAt;
  @JsonKey(name: 'merchant_name')
  String? merchantName;
  @JsonKey(name: 'customer_name')
  String? customerName;
  @JsonKey(name: 'payment_method_label')
  String? paymentMethodLabel;
  @JsonKey(name: 'wallet_note')
  String? walletNote;
  @JsonKey(name: 'primary_action_label')
  String? primaryActionLabel;
  @JsonKey(name: 'secondary_action_label')
  String? secondaryActionLabel;

  DeliveredSuccess({
    this.title,
    this.subtitle,
    this.badge,
    this.earningsTitle,
    this.earningsAmount,
    this.currency,
    this.orderReference,
    this.deliveredAt,
    this.merchantName,
    this.customerName,
    this.paymentMethodLabel,
    this.walletNote,
    this.primaryActionLabel,
    this.secondaryActionLabel,
  });

  factory DeliveredSuccess.fromJson(Map<String, dynamic> json) {
    return _$DeliveredSuccessFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveredSuccessToJson(this);
}
