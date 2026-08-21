import 'package:json_annotation/json_annotation.dart';

part 'parcel.g.dart';

@JsonSerializable()
class Parcel {
  String? description;
  num? weight;
  num? volume;

  Parcel({this.description, this.weight, this.volume});

  factory Parcel.fromJson(Map<String, dynamic> json) {
    return _$ParcelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ParcelToJson(this);
}
