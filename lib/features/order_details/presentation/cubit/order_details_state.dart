part of 'order_details_cubit.dart';

abstract class OrderDetailsState {
  const OrderDetailsState();
}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsLoading extends OrderDetailsState {}

class OrderDetailsLoaded extends OrderDetailsState {
  final OrderDetails? data;

  const OrderDetailsLoaded(this.data);
}

class OrderDetailsError extends OrderDetailsState {
  final String message;

  const OrderDetailsError(this.message);
}

class ReturnReasonsLoading extends OrderDetailsState {}

class ReturnReasonsLoaded extends OrderDetailsState {
  final List<ReasonItemModel> reasons;

  const ReturnReasonsLoaded(this.reasons);
}

class ReturnReasonsError extends OrderDetailsState {
  final String message;

  const ReturnReasonsError(this.message);
}

class RejectOrderLoading extends OrderDetailsState {}

class RejectOrderSuccess extends OrderDetailsState {
  final RejectOrderDataModel? data;
  final String message;

  const RejectOrderSuccess(this.data, this.message);
}

class RejectOrderFailure extends OrderDetailsState {
  final String message;

  const RejectOrderFailure(this.message);
}
