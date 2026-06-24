import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class ViewAllWidget extends StatelessWidget {
  const ViewAllWidget({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "طلبات قادمة",
          style: AppTextStyle.medium16(
            context,
          ).copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
        CupertinoButton(
          minimumSize: Size.zero,
          padding: EdgeInsets.all(0),
          onPressed: onPressed,
          child: Text(
            "عرض الكل",
            style: AppTextStyle.medium14(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}