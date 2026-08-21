import 'package:json_annotation/json_annotation.dart';

import 'event.dart';

part 'timeline.g.dart';

@JsonSerializable()
class Timeline {
  String? title;
  List<Event>? events;

  Timeline({this.title, this.events});

  factory Timeline.fromJson(Map<String, dynamic> json) {
    return _$TimelineFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimelineToJson(this);
}
