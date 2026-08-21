import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  String? key;
  String? label;
  String? location;
  String? at;
  @JsonKey(name: 'time_label')
  String? timeLabel;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;

  Event({
    this.key,
    this.label,
    this.location,
    this.at,
    this.timeLabel,
    this.isCompleted,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
