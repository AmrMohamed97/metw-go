import 'order_details_repository.dart';
import 'package:injectable/injectable.dart';
import '../data_source/order_details_data_source.dart';
import '../models/order_details_response.dart';

@Injectable(as: OrderDetailsRepository)
class OrderDetailsRepositoryImpl implements OrderDetailsRepository {
  final OrderDetailsDataSource dataSource;

  OrderDetailsRepositoryImpl(this.dataSource);

  @override
  Future<OrderDetailsResponse> fetchOrderDetails(int orderId) async {
    final response = await dataSource.getOrderDetails(orderId);
    return response.data;
  }
}
