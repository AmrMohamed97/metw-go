import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
	String? status;
	@JsonKey(name: 'is_verified') 
	bool? isVerified;
	@JsonKey(name: 'current_step') 
	num? currentStep;

	AuthModel({this.status, this.isVerified, this.currentStep});

	factory AuthModel.fromJson(Map<String, dynamic> json) {
		return _$AuthModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
