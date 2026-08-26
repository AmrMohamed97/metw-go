import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'availability_status')
  String? availabilityStatus;
  @JsonKey(name: 'online_started_at')
  String? onlineStartedAt;
  @JsonKey(name: 'online_duration_seconds')
  num? onlineDurationSeconds;

  Data({
    this.availabilityStatus,
    this.onlineStartedAt,
    this.onlineDurationSeconds,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
