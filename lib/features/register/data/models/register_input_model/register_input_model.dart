import 'package:json_annotation/json_annotation.dart';

part 'register_input_model.g.dart';

@JsonSerializable()
class RegisterInputModel {
	@JsonKey(name: 'first_name') 
	String? firstName;
	@JsonKey(name: 'father_name') 
	String? fatherName;
	@JsonKey(name: 'last_name') 
	String? lastName;
	String? phone;
	@JsonKey(name: 'secondary_phone') 
	String? secondaryPhone;
	String? email;
	@JsonKey(name: 'birth_date') 
	String? birthDate;
	String? gender;
	@JsonKey(name: 'address_details') 
	String? addressDetails;
	String? password;
	@JsonKey(name: 'password_confirmation') 
	String? passwordConfirmation;

	RegisterInputModel({
		this.firstName, 
		this.fatherName, 
		this.lastName, 
		this.phone, 
		this.secondaryPhone, 
		this.email, 
		this.birthDate, 
		this.gender, 
		this.addressDetails, 
		this.password, 
		this.passwordConfirmation, 
	});

	factory RegisterInputModel.fromJson(Map<String, dynamic> json) {
		return _$RegisterInputModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$RegisterInputModelToJson(this);
}
