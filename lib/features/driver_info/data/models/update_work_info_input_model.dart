import 'package:json_annotation/json_annotation.dart';

part 'update_work_info_input_model.g.dart';

@JsonSerializable()
class UpdateWorkInfoInputModel {
  @JsonKey(name: 'courier_type')
  String courierType;
  @JsonKey(name: 'warehouse_id')
  int? warehouseId;
  @JsonKey(name: 'work_types')
  List<String>? workTypes;

  UpdateWorkInfoInputModel({
    required this.courierType,
    this.warehouseId,
    this.workTypes,
  });

  factory UpdateWorkInfoInputModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorkInfoInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateWorkInfoInputModelToJson(this);
}
