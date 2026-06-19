import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/login/presentation/manager/login_cubit.dart';
import 'package:metw_go/features/login/presentation/manager/login_state.dart';
import 'package:metw_go/features/login/presentation/widgets/login_app_bar.dart';
import 'package:metw_go/features/login/presentation/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ScreenWrapper(
          backGroundColor: Theme.of(context).colorScheme.surfaceDim,
          body: CustomScrollView(
            slivers: [
              const LoginAppBar(),
              LoginBody(
                body: Form(
                  child: Column(
                    children: [
                      20.verticalSpace,
                      Center(
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: AppTextStyle.bold20(context).copyWith(
                            color: MyColors.primaryColor,
                            // fontSize: 28.sp,
                          ),
                        ),
                      ),
                      40.verticalSpace,
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          AppLocalizations.of(context)!.phoneNumber,
                          style: AppTextStyle.medium16(
                            context,
                          ).copyWith(color: MyColors.textColor),
                        ),
                      ),
                      4.verticalSpace,
                      CustomTextField(
                        hintText: "+966 5X XXX XXXX",
                        radius: 16.r,
                        textInputType: TextInputType.phone,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.end,
                      ),
                      // 20.verticalSpace,
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          AppLocalizations.of(context)!.password,
                          style: AppTextStyle.medium16(
                            context,
                          ).copyWith(color: MyColors.textColor),
                        ),
                      ),
                      4.verticalSpace,
                      CustomTextField(
                        hintText: "...............",
                        obscureText: true,
                        radius: 16.r,
                        suffixIcon: const Icon(
                          Icons.lock_outline,
                          color: MyColors.grey,
                        ),
                        isFixed: false,
                      ),
                      12.verticalSpace,
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.forgotPassword,
                            style: AppTextStyle.regular14(
                              context,
                            ).copyWith(color: MyColors.primaryColor),
                          ),
                        ),
                      ),
                      90.verticalSpace,
                      CustomButton(
                        text: AppLocalizations.of(context)!.login,
                        // textColor: MyColors.white,
                        onPressed: () {},
                        isMax: true,
                        // radius: 20.r,
                        // height: 56.h,
                      ),
                      24.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dontHaveAccount,
                            style: AppTextStyle.medium14(
                              context,
                            ).copyWith(color: MyColors.textColor),
                          ),
                          InkWell(
                            onTap: () {
                              context.pushNamed(AppRoutes.registerName);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.signUp,
                              style: AppTextStyle.medium14(
                                context,
                              ).copyWith(color: MyColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      const ViewInsetsSpace(),
                    ].animate(interval: 50.ms).fade(duration: 500.ms).slideY(begin: 0.05, end: 0),
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
