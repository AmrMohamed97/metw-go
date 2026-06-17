import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/my_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.isFixed=true ,
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
    this.onTap,
  });
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final ValueSetter? onFieldSubmitted, onSaved, onChanged;
  final VoidCallback? onTap;
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
  final bool? isFixed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isFixed == true ? 75.h : null ,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        // onTapUpOutside: (event) => FocusScope.of(context).unfocus(),
        enabled: enabled,
        textAlign: textAlign ?? TextAlign.start,
        validator: validator,
        textDirection: textDirection,
        readOnly: readOnly ?? false,
        onTap: onTap,
        autofillHints: autofillHints,
        inputFormatters: inputFormatters,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration:
            inputDecoration ??
            InputDecoration(
              hintText: hintText,
              hintStyle:
                  hintStyle ??
                  Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 12.sp,
                    color: hintColor ?? MyColors.grey,
                  ),
              errorBorder: outLineBorder(borderColor: MyColors.red),
              border: outLineBorder(),
              focusedBorder: outLineBorder(),
              enabledBorder: outLineBorder(),
              filled: filled ?? true,
              fillColor: filledColor ?? MyColors.greyFill, // Color(0xffF5F5F5),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 14.h,
                horizontal: horizontalPadding ?? 8.w,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              counter: counter,
            ),
        cursorColor: cursorColor ?? Colors.black,
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
              // color: Colors.black,
            ),
      ),
    );
  }

  OutlineInputBorder outLineBorder({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 8.0),
      borderSide: BorderSide(color: borderColor ?? const Color(0xFFF7F7F7)),
    );
  }
}
