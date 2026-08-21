import 'package:json_annotation/json_annotation.dart';

import 'point_tab.dart';

part 'ongoing_order.g.dart';

@JsonSerializable()
class OngoingOrder {
  String? mode;
  @JsonKey(name: 'header_note')
  String? headerNote;
  @JsonKey(name: 'contact_name')
  String? contactName;
  @JsonKey(name: 'contact_phone')
  String? contactPhone;
  @JsonKey(name: 'location_title')
  String? locationTitle;
  @JsonKey(name: 'location_address')
  String? locationAddress;
  @JsonKey(name: 'location_city')
  dynamic locationCity;
  @JsonKey(name: 'location_country')
  String? locationCountry;
  @JsonKey(name: 'point_tabs')
  List<PointTab>? pointTabs;
  @JsonKey(name: 'active_point_index')
  num? activePointIndex;
  @JsonKey(name: 'pickup_title')
  dynamic pickupTitle;
  @JsonKey(name: 'pickup_address')
  dynamic pickupAddress;
  @JsonKey(name: 'pickup_city')
  dynamic pickupCity;
  @JsonKey(name: 'dropoff_title')
  String? dropoffTitle;
  @JsonKey(name: 'dropoff_address')
  String? dropoffAddress;
  @JsonKey(name: 'dropoff_city')
  dynamic dropoffCity;
  @JsonKey(name: 'dropoff_country')
  String? dropoffCountry;
  @JsonKey(name: 'details_title')
  String? detailsTitle;
  @JsonKey(name: 'package_description')
  String? packageDescription;
  @JsonKey(name: 'weight_label')
  String? weightLabel;
  @JsonKey(name: 'payment_method_label')
  String? paymentMethodLabel;
  @JsonKey(name: 'order_total_label')
  String? orderTotalLabel;
  @JsonKey(name: 'delivery_fee_label')
  String? deliveryFeeLabel;
  @JsonKey(name: 'arrival_hint')
  String? arrivalHint;
  @JsonKey(name: 'primary_action_label')
  String? primaryActionLabel;

  OngoingOrder({
    this.mode,
    this.headerNote,
    this.contactName,
    this.contactPhone,
    this.locationTitle,
    this.locationAddress,
    this.locationCity,
    this.locationCountry,
    this.pointTabs,
    this.activePointIndex,
    this.pickupTitle,
    this.pickupAddress,
    this.pickupCity,
    this.dropoffTitle,
    this.dropoffAddress,
    this.dropoffCity,
    this.dropoffCountry,
    this.detailsTitle,
    this.packageDescription,
    this.weightLabel,
    this.paymentMethodLabel,
    this.orderTotalLabel,
    this.deliveryFeeLabel,
    this.arrivalHint,
    this.primaryActionLabel,
  });

  factory OngoingOrder.fromJson(Map<String, dynamic> json) {
    return _$OngoingOrderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OngoingOrderToJson(this);
}
