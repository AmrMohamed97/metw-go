import 'package:json_annotation/json_annotation.dart';

import 'registration_progress.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	String? screen;
	String? code;
	String? status;
	@JsonKey(name: 'next_action') 
	String? nextAction;
	@JsonKey(name: 'next_screen') 
	String? nextScreen;
	@JsonKey(name: 'access_token') 
	String? accessToken;
	@JsonKey(name: 'token_type') 
	String? tokenType;
	@JsonKey(name: 'registration_progress') 
	RegistrationProgress? registrationProgress;

	Data({
		this.screen, 
		this.code, 
		this.status, 
		this.nextAction, 
		this.nextScreen, 
		this.accessToken, 
		this.tokenType, 
		this.registrationProgress, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
