import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable()
class Document {
  num? id;
  @JsonKey(name: 'document_type')
  String? documentType;
  String? url;

  Document({this.id, this.documentType, this.url});

  factory Document.fromJson(Map<String, dynamic> json) {
    return _$DocumentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
