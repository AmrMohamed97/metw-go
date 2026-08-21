import 'package:json_annotation/json_annotation.dart';

part 'courier.g.dart';

@JsonSerializable()
class Courier {
  final int? id;
  @JsonKey(name: 'account_number')
  final String? accountNumber;
  final String? name;
  final String? phone;
  final String? avatar;
  final double? rating;
  @JsonKey(name: 'availability_status')
  final String? availabilityStatus;
  @JsonKey(name: 'is_profile_complete')
  final bool? isProfileComplete;

  Courier({
    this.id,
    this.accountNumber,
    this.name,
    this.phone,
    this.avatar,
    this.rating,
    this.availabilityStatus,
    this.isProfileComplete,
  });

  factory Courier.fromJson(Map<String, dynamic> json) =>
      _$CourierFromJson(json);
  Map<String, dynamic> toJson() => _$CourierToJson(this);
}
