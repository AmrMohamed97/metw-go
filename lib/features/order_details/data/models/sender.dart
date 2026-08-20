import 'package:json_annotation/json_annotation.dart';

part 'sender.g.dart';

@JsonSerializable()
class Sender {
  final String? name;
  final String? phone;

  Sender({this.name, this.phone});

  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);
  Map<String, dynamic> toJson() => _$SenderToJson(this);
}
