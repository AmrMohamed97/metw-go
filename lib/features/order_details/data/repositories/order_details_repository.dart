import 'package:metw_go/features/order_details/data/models/reject_order_input_model.dart';
import 'package:metw_go/features/order_details/data/models/reject_order_response.dart';
import 'package:metw_go/features/order_details/data/models/return_reasons_response.dart';

import '../models/order_details_response.dart';

abstract class OrderDetailsRepository {
  Future<OrderDetailsResponse> fetchOrderDetails(int orderId);
  Future<ReturnReasonsResponse> fetchReturnReasons();
  Future<RejectOrderResponse> rejectOrder(
    int orderId,
    RejectOrderInputModel body,
  );
}
