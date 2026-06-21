import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      children: [
        Expanded(child: CustomTextField(hintText: "بحث", radius: 64)),
        6.horizontalSpace,
        Container(
          width: 42,
          height: 42,
          decoration:   BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(child: Image.asset(AppImages.searchIcon)),
        ),
      ],
    );
  }
}
