import 'package:json_annotation/json_annotation.dart';
import 'package:metw_go/features/register/data/models/register_out_model/data.dart';

part 'first_step_out_model.g.dart';

@JsonSerializable()
class FirstStepOutModel {
  bool? success;
  String? message;
  Data? data;

  FirstStepOutModel({this.success, this.message, this.data});

  factory FirstStepOutModel.fromJson(Map<String, dynamic> json) =>
      _$FirstStepOutModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirstStepOutModelToJson(this);
}
