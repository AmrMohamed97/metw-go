import 'package:json_annotation/json_annotation.dart';

part 'step.g.dart';

@JsonSerializable()
class Step {
	num? number;
	String? key;
	String? route;
	@JsonKey(name: 'api_endpoint') 
	String? apiEndpoint;
	@JsonKey(name: 'is_completed') 
	bool? isCompleted;

	Step({
		this.number, 
		this.key, 
		this.route, 
		this.apiEndpoint, 
		this.isCompleted, 
	});

	factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

	Map<String, dynamic> toJson() => _$StepToJson(this);
}
