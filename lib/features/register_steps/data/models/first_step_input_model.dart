import 'package:json_annotation/json_annotation.dart';

part 'first_step_input_model.g.dart';

@JsonSerializable()
class FirstStepInputModel {
  @JsonKey(name: 'courier_type')
  String courierType;
  @JsonKey(name: 'warehouse_id')
  int? warehouseId;
  @JsonKey(name: 'work_types')
  List<String>? workTypes;

  FirstStepInputModel({
    required this.courierType,
    this.warehouseId,
    this.workTypes,
  });

  factory FirstStepInputModel.fromJson(Map<String, dynamic> json) =>
      _$FirstStepInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirstStepInputModelToJson(this);
}
