import 'package:json_annotation/json_annotation.dart';

import 'delivery_proof.dart';
import 'details_card.dart';
import 'earnings.dart';
import 'status_badge.dart';
import 'stop.dart';
import 'summary.dart';
import 'timeline.dart';

part 'order_details.g.dart';

@JsonSerializable()
class OrderDetails {
  String? title;
  @JsonKey(name: 'transport_badge_label')
  String? transportBadgeLabel;
  @JsonKey(name: 'status_badge')
  StatusBadge? statusBadge;
  Summary? summary;
  List<Stop>? stops;
  @JsonKey(name: 'details_card')
  DetailsCard? detailsCard;
  @JsonKey(name: 'customer_review')
  dynamic customerReview;
  Earnings? earnings;
  Timeline? timeline;
  @JsonKey(name: 'delivery_proof')
  DeliveryProof? deliveryProof;

  OrderDetails({
    this.title,
    this.transportBadgeLabel,
    this.statusBadge,
    this.summary,
    this.stops,
    this.detailsCard,
    this.customerReview,
    this.earnings,
    this.timeline,
    this.deliveryProof,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return _$OrderDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}
