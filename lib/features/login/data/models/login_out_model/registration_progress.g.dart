// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationProgress _$RegistrationProgressFromJson(
  Map<String, dynamic> json,
) => RegistrationProgress(
  status: json['status'] as String?,
  isRegistrationComplete: json['is_registration_complete'] as bool?,
  completedSteps: json['completed_steps'] as num?,
  totalSteps: json['total_steps'] as num?,
  remainingSteps: json['remaining_steps'] as num?,
  currentStep: json['current_step'] as num?,
  nextStep: json['next_step'] == null
      ? null
      : NextStep.fromJson(json['next_step'] as Map<String, dynamic>),
  steps: (json['steps'] as List<dynamic>?)
      ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RegistrationProgressToJson(
  RegistrationProgress instance,
) => <String, dynamic>{
  'status': instance.status,
  'is_registration_complete': instance.isRegistrationComplete,
  'completed_steps': instance.completedSteps,
  'total_steps': instance.totalSteps,
  'remaining_steps': instance.remainingSteps,
  'current_step': instance.currentStep,
  'next_step': instance.nextStep,
  'steps': instance.steps,
};
