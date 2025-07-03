import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final rotation = 0.0.obs;

  final titles = [
    'Vocabulary',
    'Alphabetical',
    'Phrases',
    'Grammar',
    'Tenses',
    'Conversation',
    'Dictionary',
  ];

  final textColor = [
    kBrightTeal,
    kWarmGold,
    kDarkGreenColor,
    kCoral,
    kSlatePurple,
    kPurple,
    kAquaBlue,
  ];

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(() {
      rotation.value = animationController.value * 2 * pi;
    });
    animationController.repeat();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
