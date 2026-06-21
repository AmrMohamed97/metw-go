import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/orders/presentation/manager/orders_cubit.dart';
import 'package:metw_go/features/orders/presentation/manager/orders_state.dart';
import 'package:metw_go/features/orders/presentation/view/filter_view.dart';
import 'package:metw_go/features/orders/presentation/view/search_view.dart';
import 'package:metw_go/features/orders/presentation/widgets/orders_item.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          final cubit = context.read<OrdersCubit>();
          return ScreenWrapper(
            appBar: const CustomAppBar(title: "الطلبات"),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  8.verticalSpace,
                  // Search Bar
                  SearchView(),
                  // Filter Chips
                  FilterView(),
                  20.verticalSpace,

                  // Orders List
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => OrdersItem(
                        orderId: "#MET-8842",
                        distance: "4.2 كم",
                        isUrgent: true,
                        pickup: "مطعم شواية الخليج - طريق التخصصي",
                        delivery: "حي النخيل - شارع الأمير سعود",
                        borderColor: MyColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
