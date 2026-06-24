import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/home/presentation/manager/home_cubit.dart';
import 'package:metw_go/features/home/presentation/manager/home_state.dart';
import 'package:metw_go/features/home/presentation/services/home_orders_view.dart';
import 'package:metw_go/features/home/presentation/view/home_today_earnings.dart';
import 'package:metw_go/features/home/presentation/view/home_wallet_view.dart';
import 'package:metw_go/features/home/presentation/widgets/home_page_app_bar.dart';
import 'package:metw_go/features/home/presentation/widgets/home_page_offline_status_card.dart';
import 'package:metw_go/features/home/presentation/widgets/home_page_online_status.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: ScreenWrapper(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            return SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 12),
                physics: const BouncingScrollPhysics(),
                children: [
                  8.verticalSpace,
                  // Top Bar
                  HomeAppBar(),
                  12.verticalSpace,
                  // Purple Status Card
                  cubit.status == 'offline'
                      ? HomePageOfflineStatusCard()
                      : HomePageOnlineStatusCard(),
                  14.verticalSpace,
                  // Today's Earnings and Completed Orders Row
                  HomeTodayEarnings(),
                  12.verticalSpace,
                  // Wallet Card
                  HomeWalletView(),
                  24.verticalSpace,
                  cubit.status == 'offline'
                      ? Image.asset(AppImages.offline)
                      // Upcoming Orders Header
                      : HomeOrdersView(),

                  40.verticalSpace,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
