import 'package:flutter/material.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? message;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final VoidCallback? onPressed;

  const CustomErrorWidget({
    super.key,
    this.message,
    this.errorMessage,
    this.onRetry,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = message ?? errorMessage ?? 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';
    final retryAction = onRetry ?? onPressed;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: Colors.redAccent,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              displayText,
              textAlign: TextAlign.center,
              style: AppTextStyle.medium16(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            if (retryAction != null) ...[
              const SizedBox(height: 24),
              CustomButton(
                text: 'إعادة المحاولة',
                onPressed: retryAction,
                backgroundColor: MyColors.primaryColor,
                textColor: Colors.white,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
