import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';
import 'package:step_progress/step_progress.dart';

class CustomSteper extends StatelessWidget {
  const CustomSteper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return StepProgress(
          currentStep: cubit.currentPage,
          totalSteps: cubit.pages.length,

          visibilityOptions: StepProgressVisibilityOptions.lineOnly,
          // controller: cubit.stepProgressController,
          highlightOptions:
              StepProgressHighlightOptions.highlightCompletedLines,
          onStepChanged: (currentIndex) {
            cubit.changePage(currentIndex);
          },
          // onStepLineTapped: (index) {
          //   debugPrint('onStepLineTapped: $index');
          // },
          theme: StepProgressThemeData(
            stepLineSpacing: 6,
            defaultForegroundColor: Theme.of(context).colorScheme.outline,
            activeForegroundColor: Theme.of(context).colorScheme.primary,
            stepLineStyle: StepLineStyle(
              lineThickness: 9,
              borderRadius: Radius.circular(2),
            ),
          ),
        );
      },
    );
  }
}
