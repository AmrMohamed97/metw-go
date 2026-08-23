import 'package:json_annotation/json_annotation.dart';

import 'required_document.dart';
import 'uploaded_document.dart';

part 'documents_form.g.dart';

@JsonSerializable()
class DocumentsForm {
  String? title;
  @JsonKey(name: 'profile_photo_url')
  String? profilePhotoUrl;
  @JsonKey(name: 'required_documents')
  List<RequiredDocument>? requiredDocuments;
  @JsonKey(name: 'uploaded_documents')
  List<UploadedDocument>? uploadedDocuments;
  @JsonKey(name: 'save_button_label')
  String? saveButtonLabel;

  DocumentsForm({
    this.title,
    this.profilePhotoUrl,
    this.requiredDocuments,
    this.uploadedDocuments,
    this.saveButtonLabel,
  });

  factory DocumentsForm.fromJson(Map<String, dynamic> json) {
    return _$DocumentsFormFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DocumentsFormToJson(this);
}
