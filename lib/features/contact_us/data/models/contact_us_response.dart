import 'package:json_annotation/json_annotation.dart';

part 'contact_us_response.g.dart';

@JsonSerializable()
class ContactUsResponse {
  final bool? success;
  final String? message;
  final ContactUsDataModel? data;

  ContactUsResponse({this.success, this.message, this.data});

  factory ContactUsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactUsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsResponseToJson(this);
}

@JsonSerializable()
class ContactUsDataModel {
  final String? heading;
  final String? description;
  @JsonKey(name: 'jobs_heading')
  final String? jobsHeading;
  @JsonKey(name: 'jobs_description')
  final String? jobsDescription;
  @JsonKey(name: 'jobs_email')
  final String? jobsEmail;
  final List<ContactItemModel>? contacts;
  final WhatsappInfoModel? whatsapp;

  ContactUsDataModel({
    this.heading,
    this.description,
    this.jobsHeading,
    this.jobsDescription,
    this.jobsEmail,
    this.contacts,
    this.whatsapp,
  });

  factory ContactUsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsDataModelToJson(this);
}

@JsonSerializable()
class ContactItemModel {
  final int? id;
  final String? type;
  final String? label;
  final String? value;
  @JsonKey(name: 'action_url')
  final String? actionUrl;

  ContactItemModel({
    this.id,
    this.type,
    this.label,
    this.value,
    this.actionUrl,
  });

  factory ContactItemModel.fromJson(Map<String, dynamic> json) =>
      _$ContactItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactItemModelToJson(this);
}

@JsonSerializable()
class WhatsappInfoModel {
  final String? phone;
  final String? message;
  @JsonKey(name: 'whatsapp_url')
  final String? whatsappUrl;
  @JsonKey(name: 'desktop_url')
  final String? desktopUrl;
  @JsonKey(name: 'mobile_url')
  final String? mobileUrl;

  WhatsappInfoModel({
    this.phone,
    this.message,
    this.whatsappUrl,
    this.desktopUrl,
    this.mobileUrl,
  });

  factory WhatsappInfoModel.fromJson(Map<String, dynamic> json) =>
      _$WhatsappInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$WhatsappInfoModelToJson(this);
}
