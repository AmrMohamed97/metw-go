import 'package:injectable/injectable.dart';
import 'package:metw_go/features/order_details/data/models/reject_order_input_model.dart';
import 'package:metw_go/features/order_details/data/models/reject_order_response.dart';
import 'package:metw_go/features/order_details/data/models/return_reasons_response.dart';

import '../data_source/order_details_data_source.dart';
import '../models/order_details_response.dart';
import 'order_details_repository.dart';

@Injectable(as: OrderDetailsRepository)
class OrderDetailsRepositoryImpl implements OrderDetailsRepository {
  final OrderDetailsDataSource dataSource;

  OrderDetailsRepositoryImpl(this.dataSource);

  @override
  Future<OrderDetailsResponse> fetchOrderDetails(int orderId) async {
    final response = await dataSource.getOrderDetails(orderId);
    return response.data;
  }

  @override
  Future<ReturnReasonsResponse> fetchReturnReasons() async {
    final response = await dataSource.getReturnReasons();
    return response.data;
  }

  @override
  Future<RejectOrderResponse> rejectOrder(
    int orderId,
    RejectOrderInputModel body,
  ) async {
    final response = await dataSource.rejectOrder(orderId, body);
    return response.data;
  }
}
