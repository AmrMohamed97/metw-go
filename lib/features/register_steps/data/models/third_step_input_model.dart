import 'package:json_annotation/json_annotation.dart';

part 'third_step_input_model.g.dart';

@JsonSerializable()
class ThirdStepInputModel {
  @JsonKey(name: 'governorate_ids')
  final List<int> governorateIds;

  @JsonKey(name: 'city_ids')
  final List<int> cityIds;

  @JsonKey(name: 'villages_service_enabled')
  final bool villagesServiceEnabled;

  ThirdStepInputModel({
    required this.governorateIds,
    required this.cityIds,
    required this.villagesServiceEnabled,
  });

  factory ThirdStepInputModel.fromJson(Map<String, dynamic> json) =>
      _$ThirdStepInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThirdStepInputModelToJson(this);
}
