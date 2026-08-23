import 'package:json_annotation/json_annotation.dart';

part 'selected_governorate.g.dart';

@JsonSerializable()
class SelectedGovernorate {
  num? id;
  String? name;

  SelectedGovernorate({this.id, this.name});

  factory SelectedGovernorate.fromJson(Map<String, dynamic> json) {
    return _$SelectedGovernorateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelectedGovernorateToJson(this);
}
