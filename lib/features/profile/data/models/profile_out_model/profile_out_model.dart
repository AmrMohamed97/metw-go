import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'profile_out_model.g.dart';

@JsonSerializable()
class ProfileOutModel {
  bool? success;
  String? message;
  Data? data;

  ProfileOutModel({this.success, this.message, this.data});

  factory ProfileOutModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileOutModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileOutModelToJson(this);
}
