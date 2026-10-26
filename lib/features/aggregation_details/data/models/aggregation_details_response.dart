import 'package:metw_go/features/aggregation/data/models/aggregation_response.dart';

class AggregationDetailsResponse {
  final bool? success;
  final String? message;
  final AggregationDetailsData? data;

  AggregationDetailsResponse({
    this.success,
    this.message,
    this.data,
  });

  factory AggregationDetailsResponse.fromJson(Map<String, dynamic> json) {
    return AggregationDetailsResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? AggregationDetailsData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}

class AggregationDetailsData {
  final String? batch;
  final AggregationBatchModel? summary;
  final List<AggregationShipmentModel> shipments;

  AggregationDetailsData({
    this.batch,
    this.summary,
    this.shipments = const [],
  });

  factory AggregationDetailsData.fromJson(Map<String, dynamic> json) {
    return AggregationDetailsData(
      batch: json['batch'] as String?,
      summary: json['summary'] != null
          ? AggregationBatchModel.fromJson(json['summary'] as Map<String, dynamic>)
          : null,
      shipments: (json['shipments'] as List<dynamic>?)
              ?.map((e) => AggregationShipmentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'batch': batch,
        'summary': summary?.toJson(),
        'shipments': shipments.map((e) => e.toJson()).toList(),
      };
}

class AggregationShipmentModel {
  final int? shipmentRequestId;
  final String? requestNumber;
  final int? storeId;
  final String? storeName;
  final String? status;
  final int? originWarehouseId;
  final int? destinationWarehouseId;
  final String? originWarehouseName;
  final String? destinationWarehouseName;
  final int? packageCount;
  final num? totalWeight;
  final num? totalVolume;
  final num? shippingCourierFee;
  final String? currency;
  final List<int> selectedByCourierIds;
  final bool? isSelectedByCurrentCourier;
  final bool? isApprovedForCurrentCourier;
  final int? assignmentId;
  final String? assignmentStatus;
  final bool? canAccept;
  final bool? canSelect;

  AggregationShipmentModel({
    this.shipmentRequestId,
    this.requestNumber,
    this.storeId,
    this.storeName,
    this.status,
    this.originWarehouseId,
    this.destinationWarehouseId,
    this.originWarehouseName,
    this.destinationWarehouseName,
    this.packageCount,
    this.totalWeight,
    this.totalVolume,
    this.shippingCourierFee,
    this.currency,
    this.selectedByCourierIds = const [],
    this.isSelectedByCurrentCourier,
    this.isApprovedForCurrentCourier,
    this.assignmentId,
    this.assignmentStatus,
    this.canAccept,
    this.canSelect,
  });

  factory AggregationShipmentModel.fromJson(Map<String, dynamic> json) {
    return AggregationShipmentModel(
      shipmentRequestId: json['shipment_request_id'] as int?,
      requestNumber: json['request_number'] as String?,
      storeId: json['store_id'] as int?,
      storeName: json['store_name'] as String?,
      status: json['status'] as String?,
      originWarehouseId: json['origin_warehouse_id'] as int?,
      destinationWarehouseId: json['destination_warehouse_id'] as int?,
      originWarehouseName: json['origin_warehouse_name'] as String?,
      destinationWarehouseName: json['destination_warehouse_name'] as String?,
      packageCount: json['package_count'] as int?,
      totalWeight: json['total_weight'] as num?,
      totalVolume: json['total_volume'] as num?,
      shippingCourierFee: json['shipping_courier_fee'] as num?,
      currency: json['currency'] as String?,
      selectedByCourierIds: (json['selected_by_courier_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      isSelectedByCurrentCourier: json['is_selected_by_current_courier'] as bool?,
      isApprovedForCurrentCourier: json['is_approved_for_current_courier'] as bool?,
      assignmentId: json['assignment_id'] as int?,
      assignmentStatus: json['assignment_status'] as String?,
      canAccept: json['can_accept'] as bool?,
      canSelect: json['can_select'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'shipment_request_id': shipmentRequestId,
        'request_number': requestNumber,
        'store_id': storeId,
        'store_name': storeName,
        'status': status,
        'origin_warehouse_id': originWarehouseId,
        'destination_warehouse_id': destinationWarehouseId,
        'origin_warehouse_name': originWarehouseName,
        'destination_warehouse_name': destinationWarehouseName,
        'package_count': packageCount,
        'total_weight': totalWeight,
        'total_volume': totalVolume,
        'shipping_courier_fee': shippingCourierFee,
        'currency': currency,
        'selected_by_courier_ids': selectedByCourierIds,
        'is_selected_by_current_courier': isSelectedByCurrentCourier,
        'is_approved_for_current_courier': isApprovedForCurrentCourier,
        'assignment_id': assignmentId,
        'assignment_status': assignmentStatus,
        'can_accept': canAccept,
        'can_select': canSelect,
      };

  /// هل الشحنة بانتظار اعتماد الأدمن بعد اختيار المندوب لها
  bool get isWaitingAdminApproval =>
      isSelectedByCurrentCourier == true && isApprovedForCurrentCourier != true;

  /// هل الشحنة معتمدة للمندوب ويمكنه قبولها
  bool get isReadyToAccept =>
      canAccept == true && assignmentId != null;
}
