import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key});

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  int _seconds = 20;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _seconds = 20;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            color: MyColors.greyFill,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "00:${_seconds.toString().padLeft(2, '0')}",
            style: AppTextStyle.medium16(
              context,
            ).copyWith(color: MyColors.secondaryColor),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _seconds == 0
              ? Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: InkWell(
                    key: const ValueKey('resend'),
                    onTap: _startTimer,
                    child: Text(
                      AppLocalizations.of(context)!.resendCode,
                      style: AppTextStyle.medium14(context).copyWith(
                        color: MyColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: MyColors.primaryColor,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(key: ValueKey('empty')),
        ),
      ],
    );
  }
}
