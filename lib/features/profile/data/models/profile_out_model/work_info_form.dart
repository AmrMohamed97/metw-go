import 'package:json_annotation/json_annotation.dart';

import 'courier_type_option.dart';
import 'work_type_option.dart';

part 'work_info_form.g.dart';

@JsonSerializable()
class WorkInfoForm {
  String? title;
  @JsonKey(name: 'courier_type')
  String? courierType;
  @JsonKey(name: 'courier_type_options')
  List<CourierTypeOption>? courierTypeOptions;
  @JsonKey(name: 'work_types')
  List<String>? workTypes;
  @JsonKey(name: 'work_type_options')
  List<WorkTypeOption>? workTypeOptions;
  @JsonKey(name: 'warehouse_id')
  num? warehouseId;
  @JsonKey(name: 'save_button_label')
  String? saveButtonLabel;

  WorkInfoForm({
    this.title,
    this.courierType,
    this.courierTypeOptions,
    this.workTypes,
    this.workTypeOptions,
    this.warehouseId,
    this.saveButtonLabel,
  });

  factory WorkInfoForm.fromJson(Map<String, dynamic> json) {
    return _$WorkInfoFormFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkInfoFormToJson(this);
}
