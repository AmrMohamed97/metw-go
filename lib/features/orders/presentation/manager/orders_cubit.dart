import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/orders/data/models/order_model.dart';
import 'package:metw_go/features/orders/data/repo/orders_repo.dart';
import 'package:metw_go/features/orders/presentation/manager/orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit(this.ordersRepo) : super(OrdersInitialState());

  List<OrderModel> orders = [];
  int currentPage = 1;
  bool hasMore = true;
  bool isLoadingMore = false;

  Future<void> getIncomingOrders({bool isLoadMore = false}) async {
    if (isLoadMore) {
      if (!hasMore || isLoadingMore) return;
      isLoadingMore = true;
      currentPage++;
      emit(IncomingOrdersPaginationLoadingState());
    } else {
      currentPage = 1;
      hasMore = true;
      orders = [];
      emit(IncomingOrdersLoadingState());
    }

    final result = await ordersRepo.getIncomingOrders(currentPage, 10);

    result.fold(
      (failure) {
        if (isLoadMore) {
          isLoadingMore = false;
          currentPage--;
          emit(IncomingOrdersPaginationErrorState(failure.message));
        } else {
          emit(IncomingOrdersErrorState(failure.message));
        }
      },
      (response) {
        final newOrders = response.data?.data ?? [];
        final meta = response.data?.meta;

        hasMore = meta?.hasMore ?? false;

        if (isLoadMore) {
          orders.addAll(newOrders);
          isLoadingMore = false;
        } else {
          orders = newOrders;
        }

        emit(IncomingOrdersLoadedState(List.from(orders)));
      },
    );
  }
}
