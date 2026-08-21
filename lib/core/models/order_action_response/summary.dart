import 'package:json_annotation/json_annotation.dart';

part 'summary.g.dart';

@JsonSerializable()
class Summary {
  @JsonKey(name: 'order_number_label')
  String? orderNumberLabel;
  @JsonKey(name: 'order_number')
  String? orderNumber;
  @JsonKey(name: 'payment_badge_label')
  String? paymentBadgeLabel;

  Summary({this.orderNumberLabel, this.orderNumber, this.paymentBadgeLabel});

  factory Summary.fromJson(Map<String, dynamic> json) {
    return _$SummaryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}
