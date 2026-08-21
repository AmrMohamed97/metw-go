import 'package:json_annotation/json_annotation.dart';

part 'firebase.g.dart';

@JsonSerializable()
class Firebase {
  @JsonKey(name: 'auth_status')
  String? authStatus;
  @JsonKey(name: 'is_authorized')
  bool? isAuthorized;
  @JsonKey(name: 'device_token_saved')
  bool? deviceTokenSaved;

  Firebase({this.authStatus, this.isAuthorized, this.deviceTokenSaved});

  factory Firebase.fromJson(Map<String, dynamic> json) =>
      _$FirebaseFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseToJson(this);
}
