import 'package:flutter/material.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/features/register/presentation/widgets/custom_steper.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_app_bar.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_body.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        FirstViewAppBar(),
        FirstViewBody(
          body: Column(
            crossAxisAlignment: .start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16.0, end: 60),
                child: CustomSteper(),
              ),
              Text(
                'المعلومات الشخصية',
                style: AppTextStyle.medium16(
                  context,
                ).copyWith(color: Theme.of(context).primaryColor),
              ),
              Text(
                'لنبدأ بإنشاء ملفك الشخصي كمندوب في MetwGo',
                style: AppTextStyle.medium14(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
