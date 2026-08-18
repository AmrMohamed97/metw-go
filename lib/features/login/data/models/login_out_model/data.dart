import 'package:json_annotation/json_annotation.dart';

import 'courier.dart';
import 'firebase.dart';
import 'registration_progress.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	String? screen;
	String? code;
	String? status;
	@JsonKey(name: 'next_action') 
	String? nextAction;
	@JsonKey(name: 'is_verified') 
	bool? isVerified;
	@JsonKey(name: 'verification_type') 
	String? verificationType;
	@JsonKey(name: 'masked_phone') 
	String? maskedPhone;
	@JsonKey(name: 'next_screen') 
	String? nextScreen;
	@JsonKey(name: 'access_token') 
	String? accessToken;
	@JsonKey(name: 'token_type') 
	String? tokenType;
	@JsonKey(name: 'registration_progress') 
	RegistrationProgress? registrationProgress;
	@JsonKey(name: 'is_authorized') 
	bool? isAuthorized;
	Courier? courier;
	Firebase? firebase;

	Data({
		this.screen, 
		this.code, 
		this.status, 
		this.nextAction, 
		this.isVerified,
		this.verificationType,
		this.maskedPhone,
		this.nextScreen, 
		this.accessToken, 
		this.tokenType, 
		this.registrationProgress, 
		this.isAuthorized,
		this.courier,
		this.firebase,
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
