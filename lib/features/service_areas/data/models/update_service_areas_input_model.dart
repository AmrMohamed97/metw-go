import 'package:json_annotation/json_annotation.dart';

part 'update_service_areas_input_model.g.dart';

@JsonSerializable()
class UpdateServiceAreasInputModel {
  @JsonKey(name: 'governorate_ids')
  final List<int> governorateIds;

  @JsonKey(name: 'city_ids')
  final List<int> cityIds;

  @JsonKey(name: 'villages_service_enabled')
  final bool villagesServiceEnabled;

  UpdateServiceAreasInputModel({
    required this.governorateIds,
    required this.cityIds,
    required this.villagesServiceEnabled,
  });

  factory UpdateServiceAreasInputModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateServiceAreasInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateServiceAreasInputModelToJson(this);
}
