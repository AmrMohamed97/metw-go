import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/widgets/order_item.dart';
import 'package:metw_go/features/orders/presentation/manager/orders_cubit.dart';
import 'package:metw_go/features/orders/presentation/manager/orders_state.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final cubit = context.read<OrdersCubit>();
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: OrderItem(
                orderId: "#MET-8842",
                distance: "4.2 كم",
                isUrgent: true,
                isTodayOrders: cubit.isTodayOrders,
                pickup: "مطعم شواية الخليج - طريق التخصصي",
                delivery: "حي النخيل - شارع الأمير سعود",
                onDetailsPressed: () =>
                    context.push(AppRoutes.orderDetailsPage),
                // borderColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        );
      },
    );
  }
}
