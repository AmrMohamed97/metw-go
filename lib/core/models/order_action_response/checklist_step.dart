import 'package:json_annotation/json_annotation.dart';

part 'checklist_step.g.dart';

@JsonSerializable()
class ChecklistStep {
  String? key;
  String? label;
  bool? completed;
  bool? required;

  ChecklistStep({this.key, this.label, this.completed, this.required});

  factory ChecklistStep.fromJson(Map<String, dynamic> json) {
    return _$ChecklistStepFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChecklistStepToJson(this);
}
