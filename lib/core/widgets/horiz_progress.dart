import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HorizontalProgress extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final Color? selectedColor;

  const HorizontalProgress({
    super.key,
    required this.currentStep,
    this.totalSteps = 100,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: totalSteps,
      currentStep: currentStep,
      size: 8,
      padding: 0,
      selectedColor: selectedColor ?? primaryColor,
      unselectedColor: kWhite,
      roundedEdges: const Radius.circular(10),
    );
  }
}
