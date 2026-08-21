import 'package:json_annotation/json_annotation.dart';

import 'checklist_step.dart';
import 'header_card.dart';
import 'pickup_map.dart';
import 'proof_photo.dart';
import 'signature.dart';

part 'pickup_confirmation.g.dart';

@JsonSerializable()
class PickupConfirmation {
  String? title;
  @JsonKey(name: 'header_card')
  HeaderCard? headerCard;
  @JsonKey(name: 'order_reference')
  String? orderReference;
  @JsonKey(name: 'merchant_name')
  String? merchantName;
  String? subtitle;
  @JsonKey(name: 'steps_title')
  String? stepsTitle;
  @JsonKey(name: 'checklist_steps')
  List<ChecklistStep>? checklistSteps;
  Signature? signature;
  @JsonKey(name: 'proof_photo')
  ProofPhoto? proofPhoto;
  @JsonKey(name: 'pickup_map')
  PickupMap? pickupMap;
  @JsonKey(name: 'confirm_button_label')
  String? confirmButtonLabel;

  PickupConfirmation({
    this.title,
    this.headerCard,
    this.orderReference,
    this.merchantName,
    this.subtitle,
    this.stepsTitle,
    this.checklistSteps,
    this.signature,
    this.proofPhoto,
    this.pickupMap,
    this.confirmButtonLabel,
  });

  factory PickupConfirmation.fromJson(Map<String, dynamic> json) {
    return _$PickupConfirmationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PickupConfirmationToJson(this);
}
