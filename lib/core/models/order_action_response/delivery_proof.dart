import 'package:json_annotation/json_annotation.dart';

import 'photo.dart';

part 'delivery_proof.g.dart';

@JsonSerializable()
class DeliveryProof {
  String? title;
  List<Photo>? photos;

  DeliveryProof({this.title, this.photos});

  factory DeliveryProof.fromJson(Map<String, dynamic> json) {
    return _$DeliveryProofFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryProofToJson(this);
}
