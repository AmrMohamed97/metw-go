import '../models/order_details_response.dart';

abstract class OrderDetailsRepository {
  Future<OrderDetailsResponse> fetchOrderDetails(int orderId);
}
