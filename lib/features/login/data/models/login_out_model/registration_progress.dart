import 'package:json_annotation/json_annotation.dart';

import 'next_step.dart';
import 'step.dart';

part 'registration_progress.g.dart';

@JsonSerializable()
class RegistrationProgress {
	String? status;
	@JsonKey(name: 'is_registration_complete') 
	bool? isRegistrationComplete;
	@JsonKey(name: 'completed_steps') 
	num? completedSteps;
	@JsonKey(name: 'total_steps') 
	num? totalSteps;
	@JsonKey(name: 'remaining_steps') 
	num? remainingSteps;
	@JsonKey(name: 'current_step') 
	num? currentStep;
	@JsonKey(name: 'next_step') 
	NextStep? nextStep;
	List<Step>? steps;

	RegistrationProgress({
		this.status, 
		this.isRegistrationComplete, 
		this.completedSteps, 
		this.totalSteps, 
		this.remainingSteps, 
		this.currentStep, 
		this.nextStep, 
		this.steps, 
	});

	factory RegistrationProgress.fromJson(Map<String, dynamic> json) {
		return _$RegistrationProgressFromJson(json);
	}

	Map<String, dynamic> toJson() => _$RegistrationProgressToJson(this);
}
