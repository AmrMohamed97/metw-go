import 'package:json_annotation/json_annotation.dart';

part 'empty_response.g.dart';

@JsonSerializable()
class EmptyResponse {
  bool? success;
  String? message;

  EmptyResponse({this.success, this.message});

  factory EmptyResponse.fromJson(Map<String, dynamic> json) {
    return _$EmptyResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmptyResponseToJson(this);
}
