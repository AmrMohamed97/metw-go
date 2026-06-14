import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/my_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.textInputType,
    this.controller,
    this.onFieldSubmitted,
    this.minLine = 1,
    this.focusNode,
    this.obscureText,
    this.onSaved,
    this.validator,
    this.inputDecoration,
    this.prefixIcon,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.textStyle,
    this.counter,
    this.hintStyle,
    this.borderColor,
    this.radius,
    this.filled,
    this.filledColor,
    this.suffixIcon,
    this.textAlign,
    this.enabled,
    this.cursorColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.cursorHieght,
    this.cursorWidth,
    this.inputFormatters,
    this.textDirection,
    this.autofillHints,
    this.readOnly,
    this.hintColor,
  });
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final ValueSetter? onFieldSubmitted, onSaved, onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  // final int maxLines;
  final int? maxLength, minLine;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final FocusNode? focusNode;
  final bool? obscureText, filled, enabled, readOnly;
  final InputDecoration? inputDecoration;
  final Widget? prefixIcon, suffixIcon, counter;
  final TextStyle? textStyle, hintStyle;
  final Color? borderColor, filledColor, cursorColor, hintColor;
  final TextDirection? textDirection;
  final Iterable<String>? autofillHints;

  final double? radius,
      verticalPadding,
      horizontalPadding,
      cursorHieght,
      cursorWidth;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      textDirection: textDirection,
      readOnly: readOnly ?? false,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration:
          inputDecoration ??
          InputDecoration(
            hintText: hintText,
            hintStyle:
                hintStyle ??
                Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 12.sp,
                  color:
                      hintColor ??
                      MyColors.darkBlueLight.withValues(alpha: 0.5),
                ),
            border: outLineBorder(),
            focusedBorder: outLineBorder(color: MyColors.purpleNormal),
            enabledBorder: outLineBorder(
              color: MyColors.darkBlueLight.withValues(alpha: 0.15),
            ),
            disabledBorder: outLineBorder(
              color: MyColors.darkBlueLight.withValues(alpha: 0.15),
            ),
            filled: filled ?? true,
            fillColor:
                filledColor ??
                MyColors.darkBlueLight.withValues(alpha: 0.1), // Glassy fill
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 16.h,
              horizontal: horizontalPadding ?? 16.w,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            counter: counter,
          ),
      cursorColor: cursorColor ?? MyColors.purpleNormal,
      cursorHeight: cursorHieght,
      cursorWidth: cursorWidth ?? 2,
      keyboardType: textInputType,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      minLines: minLine ?? 1,
      maxLines: minLine ?? 1,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLength: maxLength,
      onChanged: onChanged,
      style:
          textStyle ??
          Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 14.sp,
            color: MyColors.darkBlueLight,
          ),
    );
  }

  OutlineInputBorder outLineBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 16.0),
      borderSide: BorderSide(
        color:
            color ??
            borderColor ??
            MyColors.darkBlueLight.withValues(alpha: 0.15),
      ),
    );
  }
}
