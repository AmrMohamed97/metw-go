import 'package:json_annotation/json_annotation.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  final bool? success;
  final String? message;
  final NotificationResponseData? data;

  NotificationResponse({this.success, this.message, this.data});

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}

@JsonSerializable()
class NotificationResponseData {
  final NotificationGroupData? data;
  final NotificationLinks? links;
  final NotificationMeta? meta;
  final NotificationSummary? summary;

  NotificationResponseData({
    this.data,
    this.links,
    this.meta,
    this.summary,
  });

  factory NotificationResponseData.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseDataToJson(this);
}

@JsonSerializable()
class NotificationGroupData {
  final List<NotificationItemModel>? today;
  final List<NotificationItemModel>? others;

  NotificationGroupData({this.today, this.others});

  factory NotificationGroupData.fromJson(Map<String, dynamic> json) =>
      _$NotificationGroupDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationGroupDataToJson(this);
}

@JsonSerializable()
class NotificationItemModel {
  final String? id;
  final String? type;
  final NotificationContentData? data;
  @JsonKey(name: 'read_at')
  final String? readAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  NotificationItemModel({
    this.id,
    this.type,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationItemModelToJson(this);
}

@JsonSerializable()
class NotificationContentData {
  @JsonKey(name: 'notification_type')
  final String? notificationType;
  final String? event;
  final String? title;
  final String? body;
  final NotificationExtraData? data;
  @JsonKey(name: 'action_url')
  final String? actionUrl;

  NotificationContentData({
    this.notificationType,
    this.event,
    this.title,
    this.body,
    this.data,
    this.actionUrl,
  });

  factory NotificationContentData.fromJson(Map<String, dynamic> json) =>
      _$NotificationContentDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationContentDataToJson(this);
}

@JsonSerializable()
class NotificationExtraData {
  final String? screen;
  final String? type;
  @JsonKey(name: 'order_id')
  final dynamic orderId;
  final num? amount;
  final String? currency;
  @JsonKey(name: 'document_type')
  final String? documentType;
  @JsonKey(name: 'action_url')
  final String? actionUrl;

  NotificationExtraData({
    this.screen,
    this.type,
    this.orderId,
    this.amount,
    this.currency,
    this.documentType,
    this.actionUrl,
  });

  factory NotificationExtraData.fromJson(Map<String, dynamic> json) =>
      _$NotificationExtraDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationExtraDataToJson(this);
}

@JsonSerializable()
class NotificationLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  NotificationLinks({this.first, this.last, this.prev, this.next});

  factory NotificationLinks.fromJson(Map<String, dynamic> json) =>
      _$NotificationLinksFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationLinksToJson(this);
}

@JsonSerializable()
class NotificationMeta {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  final int? from;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? to;
  final int? total;

  NotificationMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
  });

  factory NotificationMeta.fromJson(Map<String, dynamic> json) =>
      _$NotificationMetaFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationMetaToJson(this);
}

@JsonSerializable()
class NotificationSummary {
  @JsonKey(name: 'unread_count')
  final int? unreadCount;
  @JsonKey(name: 'total_count')
  final int? totalCount;

  NotificationSummary({this.unreadCount, this.totalCount});

  factory NotificationSummary.fromJson(Map<String, dynamic> json) =>
      _$NotificationSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationSummaryToJson(this);
}
