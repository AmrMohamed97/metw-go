import 'package:json_annotation/json_annotation.dart';

part 'parcel.g.dart';

@JsonSerializable()
class Parcel {
  final String? description;
  final double? weight;
  final int? quantity;

  Parcel({this.description, this.weight, this.quantity});

  factory Parcel.fromJson(Map<String, dynamic> json) => _$ParcelFromJson(json);
  Map<String, dynamic> toJson() => _$ParcelToJson(this);
}
