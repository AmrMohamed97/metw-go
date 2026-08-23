import 'package:json_annotation/json_annotation.dart';

part 'required_document.g.dart';

@JsonSerializable()
class RequiredDocument {
  String? key;
  String? label;

  RequiredDocument({this.key, this.label});

  factory RequiredDocument.fromJson(Map<String, dynamic> json) {
    return _$RequiredDocumentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RequiredDocumentToJson(this);
}
