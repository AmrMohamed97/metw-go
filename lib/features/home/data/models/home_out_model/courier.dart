import 'package:json_annotation/json_annotation.dart';

part 'courier.g.dart';

@JsonSerializable()
class Courier {
  num? id;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  @JsonKey(name: 'account_opened_at')
  dynamic accountOpenedAt;
  String? name;
  String? phone;
  @JsonKey(name: 'approval_status')
  String? approvalStatus;
  @JsonKey(name: 'is_profile_complete')
  bool? isProfileComplete;
  String? avatar;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  num? rating;
  @JsonKey(name: 'availability_status')
  String? availabilityStatus;
  @JsonKey(name: 'online_duration_seconds')
  num? onlineDurationSeconds;

  Courier({
    this.id,
    this.accountNumber,
    this.accountOpenedAt,
    this.name,
    this.phone,
    this.approvalStatus,
    this.isProfileComplete,
    this.avatar,
    this.avatarUrl,
    this.rating,
    this.availabilityStatus,
    this.onlineDurationSeconds,
  });

  factory Courier.fromJson(Map<String, dynamic> json) {
    return _$CourierFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourierToJson(this);
}
