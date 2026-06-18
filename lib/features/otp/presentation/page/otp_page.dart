import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: InkWell(
                  onTap: () {
                    if (context.canPop()) {
                      context.pop();
                    }
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: const BoxDecoration(
                      color: MyColors.greyFill,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20.sp,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60.h),
              Text(
                "أدخل الرمز",
                style: AppTextStyle.bold24(context).copyWith(
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "أدخل الرمز المكون من 4 أرقام الذي أرسلناه للتو إلى\n000*******2010+",
                textAlign: TextAlign.center,
                style: AppTextStyle.regular16(context).copyWith(
                  color: MyColors.grey,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 48.h),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    bool isFocused = _focusNodes[index].hasFocus;
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      width: 65.w,
                      height: 65.w,
                      decoration: BoxDecoration(
                        color: isFocused ? MyColors.white : MyColors.greyFill,
                        borderRadius: BorderRadius.circular(16.r),
                        border: isFocused 
                            ? Border.all(color: MyColors.primaryColor.withOpacity(0.3), width: 1.5) 
                            : Border.all(color: Colors.transparent, width: 1.5),
                        boxShadow: isFocused
                            ? [
                                BoxShadow(
                                  color: MyColors.primaryColor.withOpacity(0.15),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                )
                              ]
                            : [],
                      ),
                      child: Center(
                        child: TextField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: AppTextStyle.bold24(context).copyWith(
                            color: MyColors.black,
                            fontSize: 24.sp,
                          ),
                          decoration: const InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                          ),
                          onChanged: (value) => _onChanged(value, index),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 48.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: MyColors.greyFill,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Text(
                  "00:20",
                  style: AppTextStyle.medium16(context).copyWith(
                    color: MyColors.secondaryColor,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              InkWell(
                onTap: () {},
                child: Text(
                  "أرسل الرمز مرة أخرى",
                  style: AppTextStyle.medium14(context).copyWith(
                    color: MyColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: MyColors.primaryColor,
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                text: "تأكيد",
                textColor: MyColors.white,
                onPressed: () {},
                isMax: true,
                radius: 20.r,
                height: 56.h,
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}