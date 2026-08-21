import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class CustomSteper extends StatelessWidget {
  const CustomSteper({super.key, required this.currentStep});
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return StepProgress(
      currentStep: currentStep,
      totalSteps: 4,

      visibilityOptions: StepProgressVisibilityOptions.lineOnly,
      // controller: cubit.stepProgressController,
      highlightOptions: StepProgressHighlightOptions.highlightCompletedLines,
      onStepChanged: (currentIndex) {
        // cubit.changePage(currentIndex);
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
  }
}
