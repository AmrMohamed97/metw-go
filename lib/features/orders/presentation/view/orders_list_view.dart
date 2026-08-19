import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/widgets/order_item.dart';
import 'package:metw_go/features/orders/presentation/manager/orders_cubit.dart';
import 'package:metw_go/features/orders/presentation/manager/orders_state.dart';

class OrdersListView extends StatefulWidget {
  const OrdersListView({super.key});

  @override
  State<OrdersListView> createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.9) {
      context.read<OrdersCubit>().getIncomingOrders(isLoadMore: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final cubit = context.read<OrdersCubit>();
        
        if (state is IncomingOrdersLoadingState) {
          return const Expanded(child: Center(child: CircularProgressIndicator()));
        }

        if (state is IncomingOrdersErrorState) {
          return Expanded(child: Center(child: Text(state.error)));
        }

        final orders = cubit.orders;

        if (orders.isEmpty) {
          return const Expanded(child: Center(child: Text("لا توجد طلبات")));
        }

        return Expanded(
          child: ListView.builder(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: orders.length + (cubit.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= orders.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final order = orders[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: OrderItem(
                  orderId: order.orderNumber ?? "",
                  distance: order.distanceKm != null ? "${order.distanceKm} كم" : "",
                  isUrgent: order.priority == "urgent",
                  // isTodayOrders: cubit.isTodayOrders,
                  pickup: order.pickupAddress ?? "",
                  delivery: order.dropoffAddress ?? "",
                  onDetailsPressed: () => context.push(AppRoutes.orderDetailsPage),
                  // borderColor: Theme.of(context).colorScheme.secondary,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
