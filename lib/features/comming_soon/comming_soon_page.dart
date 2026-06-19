import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';

class CommingSoonPage extends StatelessWidget {
  const CommingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      // appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,
          children: [
            Spacer(flex: 3),
            Image.asset(AppImages.commingSoon),
            Spacer(flex: 1),
            Center(
              child: Text(
                'شكراً لانضمامكم إلينا',
                style: AppTextStyle.medium18(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 22.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'حسابك قيد المراجعة، وسنبلغك بمجرد الموافقة عليه وجاهزيته للتفعيل.',
              textAlign: TextAlign.center,
              style: AppTextStyle.regular16(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Spacer(flex: 4),
            // ViewInsetsSpace(),
          ].animate(interval: 50.ms).fade(duration: 500.ms).slideY(begin: 0.05, end: 0),
        ),
      ),
    );
  }
}
