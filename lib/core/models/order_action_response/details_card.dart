import 'package:json_annotation/json_annotation.dart';

part 'details_card.g.dart';

@JsonSerializable()
class DetailsCard {
  String? title;
  @JsonKey(name: 'point_label')
  dynamic pointLabel;

  DetailsCard({this.title, this.pointLabel});

  factory DetailsCard.fromJson(Map<String, dynamic> json) {
    return _$DetailsCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailsCardToJson(this);
}
