import 'package:json_annotation/json_annotation.dart';

part 'uploaded_document.g.dart';

@JsonSerializable()
class UploadedDocument {
  num? id;
  @JsonKey(name: 'document_type')
  String? documentType;
  String? url;

  UploadedDocument({this.id, this.documentType, this.url});

  factory UploadedDocument.fromJson(Map<String, dynamic> json) {
    return _$UploadedDocumentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UploadedDocumentToJson(this);
}
