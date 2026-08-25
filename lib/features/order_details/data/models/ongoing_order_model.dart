import 'package:json_annotation/json_annotation.dart';

part 'ongoing_order_model.g.dart';

@JsonSerializable()
class OngoingOrderModel {
  final String? mode;
  @JsonKey(name: 'header_note')
  final String? headerNote;
  @JsonKey(name: 'contact_name')
  final String? contactName;
  @JsonKey(name: 'contact_phone')
  final String? contactPhone;
  @JsonKey(name: 'location_title')
  final String? locationTitle;
  @JsonKey(name: 'location_address')
  final String? locationAddress;
  @JsonKey(name: 'location_city')
  final String? locationCity;
  @JsonKey(name: 'location_country')
  final String? locationCountry;
  @JsonKey(name: 'dropoff_title')
  final String? dropoffTitle;
  @JsonKey(name: 'dropoff_address')
  final String? dropoffAddress;
  @JsonKey(name: 'dropoff_city')
  final String? dropoffCity;
  @JsonKey(name: 'dropoff_country')
  final String? dropoffCountry;
  @JsonKey(name: 'pickup_title')
  final String? pickupTitle;
  @JsonKey(name: 'pickup_address')
  final String? pickupAddress;
  @JsonKey(name: 'pickup_city')
  final String? pickupCity;
  @JsonKey(name: 'details_title')
  final String? detailsTitle;
  @JsonKey(name: 'package_description')
  final String? packageDescription;
  @JsonKey(name: 'weight_label')
  final String? weightLabel;
  @JsonKey(name: 'payment_method_label')
  final String? paymentMethodLabel;
  @JsonKey(name: 'order_total_label')
  final String? orderTotalLabel;
  @JsonKey(name: 'delivery_fee_label')
  final String? deliveryFeeLabel;
  @JsonKey(name: 'arrival_hint')
  final String? arrivalHint;
  @JsonKey(name: 'primary_action_label')
  final String? primaryActionLabel;

  OngoingOrderModel({
    this.mode,
    this.headerNote,
    this.contactName,
    this.contactPhone,
    this.locationTitle,
    this.locationAddress,
    this.locationCity,
    this.locationCountry,
    this.dropoffTitle,
    this.dropoffAddress,
    this.dropoffCity,
    this.dropoffCountry,
    this.pickupTitle,
    this.pickupAddress,
    this.pickupCity,
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
