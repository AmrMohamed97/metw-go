import 'package:json_annotation/json_annotation.dart';

part 'notifications.g.dart';

@JsonSerializable()
class Notifications {
  @JsonKey(name: 'unread_count')
  num? unreadCount;

  Notifications({this.unreadCount});

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return _$NotificationsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}
