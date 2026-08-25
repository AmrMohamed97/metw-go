import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/order_details/presentation/cubit/order_details_cubit.dart';

class OnWayOrderPage extends StatelessWidget {
  final int orderId;
  const OnWayOrderPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          final cubit = context.read<OrderDetailsCubit>();
        return ScreenWrapper(body: SizedBox());
      },
    );
  }
}
