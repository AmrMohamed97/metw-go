import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'home_out_model.g.dart';

@JsonSerializable()
class HomeOutModel {
  bool? success;
  String? message;
  Data? data;

  HomeOutModel({this.success, this.message, this.data});

  factory HomeOutModel.fromJson(Map<String, dynamic> json) {
    return _$HomeOutModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeOutModelToJson(this);
}
