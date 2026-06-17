
import 'package:flutter/material.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.regular14(
        context,
      ).copyWith(color: Theme.of(context).colorScheme.tertiary),
    );
  }
}