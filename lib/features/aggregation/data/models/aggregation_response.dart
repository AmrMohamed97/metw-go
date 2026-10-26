class AggregationResponse {
  final bool? success;
  final String? message;
  final AggregationData? data;

  AggregationResponse({
    this.success,
    this.message,
    this.data,
  });

  factory AggregationResponse.fromJson(Map<String, dynamic> json) {
    return AggregationResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null ? AggregationData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}

class AggregationData {
  final List<AggregationBatchModel> batches;

  AggregationData({required this.batches});

  factory AggregationData.fromJson(Map<String, dynamic> json) {
    return AggregationData(
      batches: (json['batches'] as List<dynamic>?)
              ?.map((e) => AggregationBatchModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'batches': batches.map((e) => e.toJson()).toList(),
      };
}

class AggregationStoreModel {
  final int? storeId;
  final String? storeName;
  final int? shipmentCount;

  AggregationStoreModel({
    this.storeId,
    this.storeName,
    this.shipmentCount,
  });

  factory AggregationStoreModel.fromJson(Map<String, dynamic> json) {
    return AggregationStoreModel(
      storeId: json['store_id'] as int?,
      storeName: json['store_name'] as String?,
      shipmentCount: json['shipment_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'store_id': storeId,
        'store_name': storeName,
        'shipment_count': shipmentCount,
      };
}

class AggregationBatchModel {
  final String? batch;
  final int? originWarehouseId;
  final int? destinationWarehouseId;
  final String? originWarehouseName;
  final String? destinationWarehouseName;
  final int? shipmentCount;
  final List<int> shipmentRequestIds;
  final List<int> selectedShipmentRequestIds;
  final List<int> selectableShipmentRequestIds;
  final int? storeCount;
  final List<AggregationStoreModel> stores;
  final int? selectedCount;
  final int? remainingCount;
  final String? selectionStatus;
  final String? currentCourierResult;
  final int? approvedShipmentCount;
  final int? myApprovedShipmentCount;
  final num? totalWeight;
  final num? totalVolume;
  final num? selectedWeight;
  final num? selectedVolume;
  final num? maxCarryWeight;
  final num? maxCarryVolume;
  final num? totalShippingCourierFee;
  final num? selectedShippingCourierFee;
  final String? currency;

  AggregationBatchModel({
    this.batch,
    this.originWarehouseId,
    this.destinationWarehouseId,
    this.originWarehouseName,
    this.destinationWarehouseName,
    this.shipmentCount,
    this.shipmentRequestIds = const [],
    this.selectedShipmentRequestIds = const [],
    this.selectableShipmentRequestIds = const [],
    this.storeCount,
    this.stores = const [],
    this.selectedCount,
    this.remainingCount,
    this.selectionStatus,
    this.currentCourierResult,
    this.approvedShipmentCount,
    this.myApprovedShipmentCount,
    this.totalWeight,
    this.totalVolume,
    this.selectedWeight,
    this.selectedVolume,
    this.maxCarryWeight,
    this.maxCarryVolume,
    this.totalShippingCourierFee,
    this.selectedShippingCourierFee,
    this.currency,
  });

  factory AggregationBatchModel.fromJson(Map<String, dynamic> json) {
    return AggregationBatchModel(
      batch: json['batch'] as String?,
      originWarehouseId: json['origin_warehouse_id'] as int?,
      destinationWarehouseId: json['destination_warehouse_id'] as int?,
      originWarehouseName: json['origin_warehouse_name'] as String?,
      destinationWarehouseName: json['destination_warehouse_name'] as String?,
      shipmentCount: json['shipment_count'] as int?,
      shipmentRequestIds: (json['shipment_request_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      selectedShipmentRequestIds: (json['selected_shipment_request_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      selectableShipmentRequestIds: (json['selectable_shipment_request_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      storeCount: json['store_count'] as int?,
      stores: (json['stores'] as List<dynamic>?)
              ?.map((e) => AggregationStoreModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      selectedCount: json['selected_count'] as int?,
      remainingCount: json['remaining_count'] as int?,
      selectionStatus: json['selection_status'] as String?,
      currentCourierResult: json['current_courier_result'] as String?,
      approvedShipmentCount: json['approved_shipment_count'] as int?,
      myApprovedShipmentCount: json['my_approved_shipment_count'] as int?,
      totalWeight: json['total_weight'] as num?,
      totalVolume: json['total_volume'] as num?,
      selectedWeight: json['selected_weight'] as num?,
      selectedVolume: json['selected_volume'] as num?,
      maxCarryWeight: json['max_carry_weight'] as num?,
      maxCarryVolume: json['max_carry_volume'] as num?,
      totalShippingCourierFee: json['total_shipping_courier_fee'] as num?,
      selectedShippingCourierFee: json['selected_shipping_courier_fee'] as num?,
      currency: json['currency'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'batch': batch,
        'origin_warehouse_id': originWarehouseId,
        'destination_warehouse_id': destinationWarehouseId,
        'origin_warehouse_name': originWarehouseName,
        'destination_warehouse_name': destinationWarehouseName,
        'shipment_count': shipmentCount,
        'shipment_request_ids': shipmentRequestIds,
        'selected_shipment_request_ids': selectedShipmentRequestIds,
        'selectable_shipment_request_ids': selectableShipmentRequestIds,
        'store_count': storeCount,
        'stores': stores.map((e) => e.toJson()).toList(),
        'selected_count': selectedCount,
        'remaining_count': remainingCount,
        'selection_status': selectionStatus,
        'current_courier_result': currentCourierResult,
        'approved_shipment_count': approvedShipmentCount,
        'my_approved_shipment_count': myApprovedShipmentCount,
        'total_weight': totalWeight,
        'total_volume': totalVolume,
        'selected_weight': selectedWeight,
        'selected_volume': selectedVolume,
        'max_carry_weight': maxCarryWeight,
        'max_carry_volume': maxCarryVolume,
        'total_shipping_courier_fee': totalShippingCourierFee,
        'selected_shipping_courier_fee': selectedShippingCourierFee,
        'currency': currency,
      };

  bool get isOpen => selectionStatus == 'open';
  bool get isFinalized => selectionStatus == 'finalized';
  bool get hasRemaining => (remainingCount ?? 0) > 0;
}
