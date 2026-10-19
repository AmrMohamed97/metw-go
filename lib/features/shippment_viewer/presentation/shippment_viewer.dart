import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';

class ShippmentViewer extends StatelessWidget {
  const ShippmentViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: ScreenWrapper(
        topSafeArea: true,
        appBar: AppBar(
          // title: Text(
          //   l10n.shippingRequests,
          //   style: AppTextStyle.bold18(context),
          // ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: MyColors.greyFill,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: MyColors.white,
                unselectedLabelColor: MyColors.grey,
                labelStyle: AppTextStyle.bold14(
                  context,
                ).copyWith(color: MyColors.white),
                unselectedLabelStyle: AppTextStyle.medium14(
                  context,
                ).copyWith(color: MyColors.grey),
                tabs: [
                  Tab(text: l10n.shipments),
                  Tab(text: l10n.bulkShipments),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [_ActiveShipmentsView(), _ShipmentHistoryView()],
        ),
      ),
    );
  }
}
