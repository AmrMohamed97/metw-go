import 'package:json_annotation/json_annotation.dart';

part 'actions.g.dart';

@JsonSerializable()
class Actions {
  @JsonKey(name: 'can_call')
  bool? canCall;
  @JsonKey(name: 'can_chat')
  bool? canChat;

  Actions({this.canCall, this.canChat});

  factory Actions.fromJson(Map<String, dynamic> json) {
    return _$ActionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActionsToJson(this);
}
