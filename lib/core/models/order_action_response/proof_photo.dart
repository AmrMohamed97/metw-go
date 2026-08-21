import 'package:json_annotation/json_annotation.dart';

part 'proof_photo.g.dart';

@JsonSerializable()
class ProofPhoto {
  String? title;
  String? label;
  String? placeholder;
  String? url;
  @JsonKey(name: 'is_uploaded')
  bool? isUploaded;

  ProofPhoto({
    this.title,
    this.label,
    this.placeholder,
    this.url,
    this.isUploaded,
  });

  factory ProofPhoto.fromJson(Map<String, dynamic> json) {
    return _$ProofPhotoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProofPhotoToJson(this);
}
