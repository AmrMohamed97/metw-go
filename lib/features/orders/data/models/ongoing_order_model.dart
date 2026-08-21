import 'package:json_annotation/json_annotation.dart';

part 'ongoing_order_model.g.dart';

@JsonSerializable()
class OngoingOrderModel {
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
  String? locationCity;
  @JsonKey(name: 'location_country')
  String? locationCountry;
  @JsonKey(name: 'point_tabs')
  List<PointTabModel>? pointTabs;
  @JsonKey(name: 'active_point_index')
  int? activePointIndex;
  @JsonKey(name: 'pickup_title')
  String? pickupTitle;
  @JsonKey(name: 'pickup_address')
  String? pickupAddress;
  @JsonKey(name: 'pickup_city')
  String? pickupCity;
  @JsonKey(name: 'dropoff_title')
  String? dropoffTitle;
  @JsonKey(name: 'dropoff_address')
  String? dropoffAddress;
  @JsonKey(name: 'dropoff_city')
  String? dropoffCity;
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

  OngoingOrderModel({
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

  factory OngoingOrderModel.fromJson(Map<String, dynamic> json) =>
      _$OngoingOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OngoingOrderModelToJson(this);
}

@JsonSerializable()
class PointTabModel {
  int? index;
  String? label;
  @JsonKey(name: 'is_active')
  bool? isActive;

  PointTabModel({this.index, this.label, this.isActive});

  factory PointTabModel.fromJson(Map<String, dynamic> json) =>
      _$PointTabModelFromJson(json);

  Map<String, dynamic> toJson() => _$PointTabModelToJson(this);
}
