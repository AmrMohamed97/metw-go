import 'package:json_annotation/json_annotation.dart';

part 'courier.g.dart';

@JsonSerializable()
class Courier {
  int? id;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  @JsonKey(name: 'account_opened_at')
  String? accountOpenedAt;
  String? name;
  String? phone;
  @JsonKey(name: 'approval_status')
  String? approvalStatus;
  @JsonKey(name: 'is_profile_complete')
  bool? isProfileComplete;
  String? avatar;
  double? rating;
  @JsonKey(name: 'availability_status')
  String? availabilityStatus;
  @JsonKey(name: 'online_duration_seconds')
  int? onlineDurationSeconds;

  Courier({
    this.id,
    this.accountNumber,
    this.accountOpenedAt,
    this.name,
    this.phone,
    this.approvalStatus,
    this.isProfileComplete,
    this.avatar,
    this.rating,
    this.availabilityStatus,
    this.onlineDurationSeconds,
  });

  factory Courier.fromJson(Map<String, dynamic> json) =>
      _$CourierFromJson(json);

  Map<String, dynamic> toJson() => _$CourierToJson(this);
}
