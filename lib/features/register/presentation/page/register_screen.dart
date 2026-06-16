import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
          return ExpandablePageView.builder(
            controller: cubit.pageController,
            onPageChanged: (value) {
              cubit.changePage(value);
            },
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'onboardTitle[index]',
                      style: AppTextStyle.bold14(
                        context,
                      ).copyWith(fontSize: 28, color: MyColors.secondaryColor),
                    ),
                  ),
                  if (cubit.currentPage == 0)
                    Column(
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          r'تحتاج شرح أكثر؟',
                          style: AppTextStyle.bold18(context),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  CustomTextField(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
