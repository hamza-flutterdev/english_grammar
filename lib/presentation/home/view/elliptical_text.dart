import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_styles.dart';
import '../controller/home_controller.dart';

class EllipticalTextPainter extends CustomPainter {
  final List<String> texts;
  final double rotation;
  final controller = Get.find<HomeController>();

  EllipticalTextPainter({required this.texts, required this.rotation});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final a = size.width;
    final b = size.height;

    final radiusOffset = 35.0;

    final totalCount = 21;
    final repeatedTexts = List.generate(
      totalCount,
      (i) => texts[i % texts.length],
    );
    final angleStep = 2 * pi / totalCount;

    for (int i = 0; i < repeatedTexts.length; i++) {
      final angle = rotation + angleStep * i;

      final x = centerX + (a / 2 - radiusOffset) * cos(angle);
      final y = centerY + (b / 2.4 - radiusOffset) * sin(angle);

      final textSpan = TextSpan(
        text: repeatedTexts[i],
        style: titleSmallBoldStyle.copyWith(
          color: controller.textColor[i % controller.textColor.length],
        ),
      );

      final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr)
        ..layout();

      tp.paint(canvas, Offset(x - tp.width / 2, y - tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
