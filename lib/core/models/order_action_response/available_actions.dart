import 'package:json_annotation/json_annotation.dart';

part 'available_actions.g.dart';

@JsonSerializable()
class AvailableActions {
  @JsonKey(name: 'arrive_pickup')
  bool? arrivePickup;
  @JsonKey(name: 'confirm_pickup')
  bool? confirmPickup;
  @JsonKey(name: 'arrive_dropoff')
  bool? arriveDropoff;
  @JsonKey(name: 'complete_delivery')
  bool? completeDelivery;

  AvailableActions({
    this.arrivePickup,
    this.confirmPickup,
    this.arriveDropoff,
    this.completeDelivery,
  });

  factory AvailableActions.fromJson(Map<String, dynamic> json) {
    return _$AvailableActionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AvailableActionsToJson(this);
}
