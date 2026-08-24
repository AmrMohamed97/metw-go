// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsResponse _$ContactUsResponseFromJson(Map<String, dynamic> json) =>
    ContactUsResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ContactUsDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactUsResponseToJson(ContactUsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

ContactUsDataModel _$ContactUsDataModelFromJson(Map<String, dynamic> json) =>
    ContactUsDataModel(
      heading: json['heading'] as String?,
      description: json['description'] as String?,
      jobsHeading: json['jobs_heading'] as String?,
      jobsDescription: json['jobs_description'] as String?,
      jobsEmail: json['jobs_email'] as String?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => ContactItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      whatsapp: json['whatsapp'] == null
          ? null
          : WhatsappInfoModel.fromJson(
              json['whatsapp'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ContactUsDataModelToJson(ContactUsDataModel instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'description': instance.description,
      'jobs_heading': instance.jobsHeading,
      'jobs_description': instance.jobsDescription,
      'jobs_email': instance.jobsEmail,
      'contacts': instance.contacts,
      'whatsapp': instance.whatsapp,
    };

ContactItemModel _$ContactItemModelFromJson(Map<String, dynamic> json) =>
    ContactItemModel(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      label: json['label'] as String?,
      value: json['value'] as String?,
      actionUrl: json['action_url'] as String?,
    );

Map<String, dynamic> _$ContactItemModelToJson(ContactItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'label': instance.label,
      'value': instance.value,
      'action_url': instance.actionUrl,
    };

WhatsappInfoModel _$WhatsappInfoModelFromJson(Map<String, dynamic> json) =>
    WhatsappInfoModel(
      phone: json['phone'] as String?,
      message: json['message'] as String?,
      whatsappUrl: json['whatsapp_url'] as String?,
      desktopUrl: json['desktop_url'] as String?,
      mobileUrl: json['mobile_url'] as String?,
    );

Map<String, dynamic> _$WhatsappInfoModelToJson(WhatsappInfoModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'message': instance.message,
      'whatsapp_url': instance.whatsappUrl,
      'desktop_url': instance.desktopUrl,
      'mobile_url': instance.mobileUrl,
    };
