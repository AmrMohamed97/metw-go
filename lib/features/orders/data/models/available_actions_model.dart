import 'package:json_annotation/json_annotation.dart';

part 'available_actions_model.g.dart';

@JsonSerializable()
class AvailableActionsModel {
  @JsonKey(name: 'arrive_pickup')
  bool? arrivePickup;
  @JsonKey(name: 'confirm_pickup')
  bool? confirmPickup;
  @JsonKey(name: 'arrive_dropoff')
  bool? arriveDropoff;
  @JsonKey(name: 'complete_delivery')
  bool? completeDelivery;

  AvailableActionsModel({
    this.arrivePickup,
    this.confirmPickup,
    this.arriveDropoff,
    this.completeDelivery,
  });

  factory AvailableActionsModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableActionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableActionsModelToJson(this);
}
