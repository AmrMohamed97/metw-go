import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return ScreenWrapper(
          backGroundColor: cubit.currentPage == 0
              ? Theme.of(context).colorScheme.scrim
              : null,
          body: ExpandablePageView.builder(
            controller: cubit.pageController,
            onPageChanged: (value) {
              cubit.changePage(value);
            },
            itemCount: 3,
            itemBuilder: (context, index) => cubit.pages[index],
          ),
        );
      },
    );
  }
}
