import 'package:json_annotation/json_annotation.dart';

part 'checklist.g.dart';

@JsonSerializable()
class Checklist {
  @JsonKey(name: 'package_count_verified')
  String? packageCountVerified;
  @JsonKey(name: 'package_condition_verified')
  String? packageConditionVerified;
  @JsonKey(name: 'merchant_signature_obtained')
  String? merchantSignatureObtained;

  Checklist({
    this.packageCountVerified,
    this.packageConditionVerified,
    this.merchantSignatureObtained,
  });

  factory Checklist.fromJson(Map<String, dynamic> json) {
    return _$ChecklistFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChecklistToJson(this);
}
