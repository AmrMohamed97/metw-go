import 'package:flutter/material.dart';
import 'package:metw_go/core/theme/my_colors.dart';

abstract class DateHelper {
  static Future<DateTime?> pickDateTime(BuildContext context) async {
    final date = await pickDate(context);

    if (date == null || !context.mounted) return null;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: MyColors.secondaryColor, // header color
              onPrimary: Colors.white, // header text
              surface: Colors.grey.shade900, // background color
              onSurface: Colors.white,
              secondary: MyColors.secondaryColor, // calendar text color
            ),
            dialogTheme: DialogThemeData(backgroundColor: Colors.grey.shade900),
          ),
          child: child!,
        );
      },
    );

    if (time == null) return null;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    return dateTime;
  }

  static Future<DateTime?> pickDate(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: MyColors.secondaryColor, // header color
              onPrimary: Colors.white, // header text
              surface: Colors.grey.shade900, // background color
              onSurface: Colors.white, // calendar text color
            ),
            dialogTheme: DialogThemeData(backgroundColor: Colors.grey.shade900),
          ),
          child: child!,
        );
      },
    );
  }
}
