import 'package:json_annotation/json_annotation.dart';

part 'receiver.g.dart';

@JsonSerializable()
class Receiver {
  String? name;
  String? phone;

  Receiver({this.name, this.phone});

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return _$ReceiverFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReceiverToJson(this);
}
