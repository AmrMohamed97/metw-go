import 'package:json_annotation/json_annotation.dart';

part 'signature.g.dart';

@JsonSerializable()
class Signature {
  String? title;
  String? label;
  @JsonKey(name: 'reset_label')
  String? resetLabel;
  String? value;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  String? placeholder;

  Signature({
    this.title,
    this.label,
    this.resetLabel,
    this.value,
    this.isCompleted,
    this.placeholder,
  });

  factory Signature.fromJson(Map<String, dynamic> json) {
    return _$SignatureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignatureToJson(this);
}
