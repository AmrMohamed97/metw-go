import 'package:json_annotation/json_annotation.dart';

part 'stats_card.g.dart';

@JsonSerializable()
class StatsCard {
  String? key;
  String? label;
  num? value;
  String? currency;

  StatsCard({this.key, this.label, this.value, this.currency});

  factory StatsCard.fromJson(Map<String, dynamic> json) {
    return _$StatsCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatsCardToJson(this);
}
