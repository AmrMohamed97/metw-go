import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:pinput/pinput.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({super.key, this.onCompleted});
  final void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: Pinput(
        // controller: context.read<OtpCubit>().controller,
        length: 4,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        validator: validateOTP,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        defaultPinTheme: defaultPinTheme(context),
        focusedPinTheme: focusedPinTheme(context),
        submittedPinTheme: submittedPinTheme(context),
        onCompleted: onCompleted,
      ),
    );
  }
}

PinTheme defaultPinTheme(BuildContext context) {
  return PinTheme(
    width: 65,
    height: 65,
    textStyle: AppTextStyle.regular16(context).copyWith(
      fontSize: 20,
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300, width: 1.2),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
  );
}

PinTheme focusedPinTheme(BuildContext context) {
  final primaryColor = Theme.of(context).colorScheme.primary;

  return defaultPinTheme(context).copyWith(
    decoration: defaultPinTheme(context).decoration!.copyWith(
      border: Border.all(color: primaryColor, width: 2),
      boxShadow: [
        BoxShadow(
          color: primaryColor.withValues(alpha: 0.2),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
  );
}

PinTheme submittedPinTheme(BuildContext context) {
  final primaryColor = Theme.of(context).colorScheme.primary;

  return defaultPinTheme(context).copyWith(
    decoration: defaultPinTheme(context).decoration!.copyWith(
      color: primaryColor.withValues(alpha: 0.05),
      border: Border.all(color: primaryColor),
    ),
  );
}

String? validateOTP(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter OTP code';
  } else {
    return null;
  }
}
