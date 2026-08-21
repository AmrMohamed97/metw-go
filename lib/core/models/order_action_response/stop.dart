import 'package:json_annotation/json_annotation.dart';

import 'actions.dart';

part 'stop.g.dart';

@JsonSerializable()
class Stop {
  String? type;
  String? title;
  String? name;
  String? address;
  String? phone;
  @JsonKey(name: 'marker_color')
  String? markerColor;
  @JsonKey(name: 'marker_label')
  dynamic markerLabel;
  Actions? actions;

  Stop({
    this.type,
    this.title,
    this.name,
    this.address,
    this.phone,
    this.markerColor,
    this.markerLabel,
    this.actions,
  });

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);

  Map<String, dynamic> toJson() => _$StopToJson(this);
}
