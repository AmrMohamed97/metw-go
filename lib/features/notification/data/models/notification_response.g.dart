// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
  Map<String, dynamic> json,
) => NotificationResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : NotificationResponseData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationResponseToJson(
  NotificationResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

NotificationResponseData _$NotificationResponseDataFromJson(
  Map<String, dynamic> json,
) => NotificationResponseData(
  data: json['data'] == null
      ? null
      : NotificationGroupData.fromJson(json['data'] as Map<String, dynamic>),
  links: json['links'] == null
      ? null
      : NotificationLinks.fromJson(json['links'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : NotificationMeta.fromJson(json['meta'] as Map<String, dynamic>),
  summary: json['summary'] == null
      ? null
      : NotificationSummary.fromJson(json['summary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationResponseDataToJson(
  NotificationResponseData instance,
) => <String, dynamic>{
  'data': instance.data,
  'links': instance.links,
  'meta': instance.meta,
  'summary': instance.summary,
};

NotificationGroupData _$NotificationGroupDataFromJson(
  Map<String, dynamic> json,
) => NotificationGroupData(
  today: (json['today'] as List<dynamic>?)
      ?.map((e) => NotificationItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  others: (json['others'] as List<dynamic>?)
      ?.map((e) => NotificationItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NotificationGroupDataToJson(
  NotificationGroupData instance,
) => <String, dynamic>{'today': instance.today, 'others': instance.others};

NotificationItemModel _$NotificationItemModelFromJson(
  Map<String, dynamic> json,
) => NotificationItemModel(
  id: json['id'] as String?,
  type: json['type'] as String?,
  data: json['data'] == null
      ? null
      : NotificationContentData.fromJson(json['data'] as Map<String, dynamic>),
  readAt: json['read_at'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$NotificationItemModelToJson(
  NotificationItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'data': instance.data,
  'read_at': instance.readAt,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

NotificationContentData _$NotificationContentDataFromJson(
  Map<String, dynamic> json,
) => NotificationContentData(
  notificationType: json['notification_type'] as String?,
  event: json['event'] as String?,
  title: json['title'] as String?,
  body: json['body'] as String?,
  data: json['data'] == null
      ? null
      : NotificationExtraData.fromJson(json['data'] as Map<String, dynamic>),
  actionUrl: json['action_url'] as String?,
);

Map<String, dynamic> _$NotificationContentDataToJson(
  NotificationContentData instance,
) => <String, dynamic>{
  'notification_type': instance.notificationType,
  'event': instance.event,
  'title': instance.title,
  'body': instance.body,
  'data': instance.data,
  'action_url': instance.actionUrl,
};

NotificationExtraData _$NotificationExtraDataFromJson(
  Map<String, dynamic> json,
) => NotificationExtraData(
  screen: json['screen'] as String?,
  type: json['type'] as String?,
  orderId: json['order_id'],
  amount: json['amount'] as num?,
  currency: json['currency'] as String?,
  documentType: json['document_type'] as String?,
  actionUrl: json['action_url'] as String?,
);

Map<String, dynamic> _$NotificationExtraDataToJson(
  NotificationExtraData instance,
) => <String, dynamic>{
  'screen': instance.screen,
  'type': instance.type,
  'order_id': instance.orderId,
  'amount': instance.amount,
  'currency': instance.currency,
  'document_type': instance.documentType,
  'action_url': instance.actionUrl,
};

NotificationLinks _$NotificationLinksFromJson(Map<String, dynamic> json) =>
    NotificationLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$NotificationLinksToJson(NotificationLinks instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

NotificationMeta _$NotificationMetaFromJson(Map<String, dynamic> json) =>
    NotificationMeta(
      currentPage: (json['current_page'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotificationMetaToJson(NotificationMeta instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

NotificationSummary _$NotificationSummaryFromJson(Map<String, dynamic> json) =>
    NotificationSummary(
      unreadCount: (json['unread_count'] as num?)?.toInt(),
      totalCount: (json['total_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotificationSummaryToJson(
  NotificationSummary instance,
) => <String, dynamic>{
  'unread_count': instance.unreadCount,
  'total_count': instance.totalCount,
};
