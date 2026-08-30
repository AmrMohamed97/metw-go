import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/order_details/data/models/reject_order_input_model.dart';
import 'package:metw_go/features/order_details/data/models/reject_order_response.dart';
import 'package:metw_go/features/order_details/data/models/return_reasons_response.dart';

import '../../data/models/order_details_response.dart';
import '../../data/repositories/order_details_repository.dart';

part 'order_details_state.dart';

@injectable
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRepository repository;

  OrderDetailsCubit(this.repository) : super(OrderDetailsInitial());

  OrderDetails? orderDetails;
  List<ReasonItemModel> returnReasons = [];

  Future<void> fetchOrderDetails(int orderId) async {
    emit(OrderDetailsLoading());
    try {
      final response = await repository.fetchOrderDetails(orderId);
      orderDetails = response.data;
      emit(OrderDetailsLoaded(orderDetails));
    } catch (e) {
      emit(OrderDetailsError(e.toString()));
    }
  }

  Future<void> fetchReturnReasons() async {
    emit(ReturnReasonsLoading());
    try {
      final response = await repository.fetchReturnReasons();
      returnReasons = response.data ?? [];
      emit(ReturnReasonsLoaded(returnReasons));
    } catch (e) {
      emit(ReturnReasonsError(e.toString()));
    }
  }

  Future<void> rejectOrder({
    required int orderId,
    required int reasonId,
    String? customReason,
  }) async {
    emit(RejectOrderLoading());
    try {
      final input = RejectOrderInputModel(
        reasonId: reasonId,
        customReason: customReason,
      );
      final response = await repository.rejectOrder(orderId, input);
      if (response.success == true) {
        emit(
          RejectOrderSuccess(
            response.data,
            response.message ?? 'تم رفض الطلب بنجاح',
          ),
        );
      } else {
        emit(RejectOrderFailure(response.message ?? 'حدث خطأ أثناء رفض الطلب'));
      }
    } catch (e) {
      emit(RejectOrderFailure(e.toString()));
    }
  }
}
