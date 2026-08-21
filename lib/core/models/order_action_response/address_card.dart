import 'package:json_annotation/json_annotation.dart';

part 'address_card.g.dart';

@JsonSerializable()
class AddressCard {
  String? title;
  String? address;
  dynamic city;
  String? country;

  AddressCard({this.title, this.address, this.city, this.country});

  factory AddressCard.fromJson(Map<String, dynamic> json) {
    return _$AddressCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressCardToJson(this);
}
