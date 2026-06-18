import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/login/presentation/manager/login_cubit.dart';
import 'package:metw_go/features/login/presentation/manager/login_state.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_app_bar.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bool _shouldAnimate = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ScreenWrapper(
          backGroundColor: Theme.of(context).colorScheme.scrim,
          body: CustomScrollView(
            slivers: [
              const FirstViewAppBar(),
              FirstViewBody(
                animate: _shouldAnimate,
                body: Form(
                  child: AnimatedColumn(
                    children: [
                      30.verticalSpace,
                      Center(
                        child: Text(
                          "تسجيل الدخول",
                          style: AppTextStyle.bold24(context).copyWith(
                            color: MyColors.primaryColor,
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                      40.verticalSpace,
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "رقم الهاتف",
                          style: AppTextStyle.medium16(
                            context,
                          ).copyWith(color: MyColors.textColor),
                        ),
                      ),
                      12.verticalSpace,
                      CustomTextField(
                        hintText: "+966 5X XXX XXXX",
                        radius: 16.r,
                        textInputType: TextInputType.phone,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.end,
                      ),
                      20.verticalSpace,
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "كلمة المرور",
                          style: AppTextStyle.medium16(
                            context,
                          ).copyWith(color: MyColors.textColor),
                        ),
                      ),
                      12.verticalSpace,
                      CustomTextField(
                        hintText: "...............",
                        obscureText: true,
                        radius: 16.r,
                        suffixIcon: const Icon(
                          Icons.lock_outline,
                          color: MyColors.grey,
                        ),
                      ),
                      12.verticalSpace,
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "نسيت كلمة المرور؟",
                            style: AppTextStyle.regular14(
                              context,
                            ).copyWith(color: MyColors.primaryColor),
                          ),
                        ),
                      ),
                      40.verticalSpace,
                      CustomButton(
                        text: "تسجيل الدخول",
                        // textColor: MyColors.white,
                        onPressed: () {},
                        isMax: true,
                        radius: 20.r,
                        height: 56.h,
                      ),
                      24.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ليس لديك حساب؟ ",
                            style: AppTextStyle.medium14(
                              context,
                            ).copyWith(color: MyColors.textColor),
                          ),
                          InkWell(
                            onTap: () {
                              context.pushNamed(AppRoutes.registerName);
                            },
                            child: Text(
                              "انشاء حساب",
                              style: AppTextStyle.medium14(
                                context,
                              ).copyWith(color: MyColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      const ViewInsetsSpace(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
