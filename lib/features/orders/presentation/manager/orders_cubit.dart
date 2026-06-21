import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/orders/presentation/manager/orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitialState());
  bool isTodayOrders = true;
  void selectTodayOrders(bool isTodayOrders) {
    this.isTodayOrders = isTodayOrders;
    emit(ChangeViewOrdersState());
  }
}
