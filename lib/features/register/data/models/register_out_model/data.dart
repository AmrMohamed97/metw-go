import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	@JsonKey(name: 'registration_token') 
	String? registrationToken;
	@JsonKey(name: 'current_step') 
	num? currentStep;

	Data({this.registrationToken, this.currentStep});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
