import 'package:json_annotation/json_annotation.dart';

part 'header_card.g.dart';

@JsonSerializable()
class HeaderCard {
  @JsonKey(name: 'order_reference')
  String? orderReference;
  @JsonKey(name: 'merchant_name')
  String? merchantName;
  String? subtitle;

  HeaderCard({this.orderReference, this.merchantName, this.subtitle});

  factory HeaderCard.fromJson(Map<String, dynamic> json) {
    return _$HeaderCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HeaderCardToJson(this);
}
