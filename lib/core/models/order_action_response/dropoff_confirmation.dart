import 'package:json_annotation/json_annotation.dart';

import 'address_card.dart';
import 'map.dart';
import 'payment.dart';
import 'proof_photo.dart';
import 'signature.dart';
import 'verification.dart';

part 'dropoff_confirmation.g.dart';

@JsonSerializable()
class DropoffConfirmation {
  String? title;
  @JsonKey(name: 'address_card')
  AddressCard? addressCard;
  @JsonKey(name: 'address_title')
  String? addressTitle;
  @JsonKey(name: 'receiver_name')
  String? receiverName;
  String? address;
  Signature? signature;
  @JsonKey(name: 'proof_photo')
  ProofPhoto? proofPhoto;
  Payment? payment;
  Verification? verification;
  DropoffMap? map;
  @JsonKey(name: 'confirm_button_label')
  String? confirmButtonLabel;

  DropoffConfirmation({
    this.title,
    this.addressCard,
    this.addressTitle,
    this.receiverName,
    this.address,
    this.signature,
    this.proofPhoto,
    this.payment,
    this.verification,
    this.map,
    this.confirmButtonLabel,
  });

  factory DropoffConfirmation.fromJson(Map<String, dynamic> json) {
    return _$DropoffConfirmationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DropoffConfirmationToJson(this);
}
