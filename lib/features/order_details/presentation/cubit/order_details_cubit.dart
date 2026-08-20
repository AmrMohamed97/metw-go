import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/order_details_response.dart';
import '../../data/repositories/order_details_repository.dart';
import 'package:injectable/injectable.dart';
part 'order_details_state.dart';

@injectable
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRepository repository;

  OrderDetailsCubit(this.repository) : super(OrderDetailsInitial());

  Future<void> fetchOrderDetails(int orderId) async {
    emit(OrderDetailsLoading());
    try {
      final response = await repository.fetchOrderDetails(orderId);
      emit(OrderDetailsLoaded(response.data));
    } catch (e) {
      emit(OrderDetailsError(e.toString()));
    }
  }
}
