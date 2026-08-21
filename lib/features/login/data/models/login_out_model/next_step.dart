import 'package:json_annotation/json_annotation.dart';

part 'next_step.g.dart';

@JsonSerializable()
class NextStep {
  num? number;
  String? key;
  String? route;
  @JsonKey(name: 'api_endpoint')
  String? apiEndpoint;

  NextStep({this.number, this.key, this.route, this.apiEndpoint});

  factory NextStep.fromJson(Map<String, dynamic> json) {
    return _$NextStepFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NextStepToJson(this);
}
