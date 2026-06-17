import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class AdsWidgets extends StatelessWidget {
  const AdsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          decoration: BoxDecoration(
            color: const Color(0xFF6B1A99), // Purple from design
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.higherProfitOpp,
                      style: AppTextStyle.medium16(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    4.verticalSpace,
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.intercityShippingIncreasesIncome,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: Colors.white.withValues(alpha: 0.8)),
                    ),
                  ],
                ),
              ),
              24.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.trending_up, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            margin: EdgeInsetsDirectional.only(top: 16, end: 35),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .1),
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(12),
                bottomStart: Radius.circular(12),
                topEnd: Radius.circular(105),
                bottomEnd: Radius.circular(116),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
