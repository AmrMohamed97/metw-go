// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
  title: json['title'] as String?,
  transportBadgeLabel: json['transport_badge_label'] as String?,
  statusBadge: json['status_badge'] == null
      ? null
      : StatusBadge.fromJson(json['status_badge'] as Map<String, dynamic>),
  summary: json['summary'] == null
      ? null
      : Summary.fromJson(json['summary'] as Map<String, dynamic>),
  stops: (json['stops'] as List<dynamic>?)
      ?.map((e) => Stop.fromJson(e as Map<String, dynamic>))
      .toList(),
  detailsCard: json['details_card'] == null
      ? null
      : DetailsCard.fromJson(json['details_card'] as Map<String, dynamic>),
  customerReview: json['customer_review'],
  earnings: json['earnings'] == null
      ? null
      : Earnings.fromJson(json['earnings'] as Map<String, dynamic>),
  timeline: json['timeline'] == null
      ? null
      : Timeline.fromJson(json['timeline'] as Map<String, dynamic>),
  deliveryProof: json['delivery_proof'] == null
      ? null
      : DeliveryProof.fromJson(json['delivery_proof'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
      'transport_badge_label': instance.transportBadgeLabel,
      'status_badge': instance.statusBadge,
      'summary': instance.summary,
      'stops': instance.stops,
      'details_card': instance.detailsCard,
      'customer_review': instance.customerReview,
      'earnings': instance.earnings,
      'timeline': instance.timeline,
      'delivery_proof': instance.deliveryProof,
    };
