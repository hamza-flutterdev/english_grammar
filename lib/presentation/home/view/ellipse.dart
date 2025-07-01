import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class EllipseBorderPainter extends CustomPainter {
  final double strokeWidth;

  EllipseBorderPainter({required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = primaryColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

    canvas.drawOval(
      Rect.fromLTWH(-size.width, 0, size.width * 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
