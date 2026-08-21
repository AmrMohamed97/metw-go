import 'package:json_annotation/json_annotation.dart';

part 'lifecycle.g.dart';

@JsonSerializable()
class Lifecycle {
  @JsonKey(name: 'can_start')
  final bool? canStart;

  Lifecycle({this.canStart});

  factory Lifecycle.fromJson(Map<String, dynamic> json) =>
      _$LifecycleFromJson(json);
  Map<String, dynamic> toJson() => _$LifecycleToJson(this);
}
