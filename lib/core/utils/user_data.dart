import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final int id;
  final String name;
  final String lname;
  final String? email;
  final String phone;
  final String img;
  final String type;
  @JsonKey(name: "role_id")
  final int roleId;

  UserData({
    required this.id,
    required this.name,
    required this.lname,
    required this.email,
    required this.phone,
    required this.img,
    required this.type,
    required this.roleId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
