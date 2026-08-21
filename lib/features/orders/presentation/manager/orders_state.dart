import 'package:metw_go/features/orders/data/models/order_model.dart';

abstract class OrdersState {}

class OrdersInitialState extends OrdersState {}

class ChangeViewOrdersState extends OrdersState {}

class IncomingOrdersLoadingState extends OrdersState {}

class IncomingOrdersLoadedState extends OrdersState {
  final List<OrderModel> orders;
  IncomingOrdersLoadedState(this.orders);
}

class IncomingOrdersErrorState extends OrdersState {
  final String error;
  IncomingOrdersErrorState(this.error);
}

class IncomingOrdersPaginationLoadingState extends OrdersState {}

class IncomingOrdersPaginationErrorState extends OrdersState {
  final String error;
  IncomingOrdersPaginationErrorState(this.error);
}
