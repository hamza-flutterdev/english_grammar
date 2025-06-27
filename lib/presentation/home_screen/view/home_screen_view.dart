import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/widgets/menu_option_row.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: 'English Learning', useBackButton: false),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          final isWide = width > 450;
          final isMedium = width > 360;

          final startingTop = height * 0.02;

          double getLeftOffset(int index) {
            if (isWide) {
              return [0.11, 0.31, 0.42, 0.47, 0.46, 0.37, 0.19][index] * width;
            } else if (isMedium) {
              return [0.09, 0.32, 0.43, 0.47, 0.45, 0.36, 0.20][index] * width;
            } else {
              return [0.12, 0.30, 0.42, 0.48, 0.46, 0.38, 0.22][index] * width;
            }
          }

          final options = [
            MenuOptionData(
              title: 'Vocabulary',
              subtitle: '(Category wise)',
              urduText: 'ذخیرہ الفاظ',
              assetPath: 'assets/images/home-img/vocabulary.png',
              backgroundColor: kBrightTeal,
              onTap: () => Get.toNamed(AppRoutes.vocabulary),
            ),
            MenuOptionData(
              title: 'Vocabulary',
              subtitle: '(Alphabetical Order)',
              urduText: 'ذخیرہ الفاظ',
              assetPath: 'assets/images/home-img/alphabet.png',
              backgroundColor: kWarmGold,
              onTap: () => Get.toNamed(AppRoutes.alphabet),
            ),
            MenuOptionData(
              title: 'Phrases',
              urduText: 'جملے',
              assetPath: 'assets/images/home-img/phrases.png',
              backgroundColor: kMintGreen,
              onTap: () => Get.toNamed(AppRoutes.phrases),
            ),
            MenuOptionData(
              title: 'Grammar',
              urduText: 'گرامر',
              assetPath: 'assets/images/home-img/grammar.png',
              backgroundColor: kCoral,
              onTap: () => Get.toNamed(AppRoutes.grammar),
            ),
            MenuOptionData(
              title: 'Tenses',
              urduText: 'زمانے',
              assetPath: 'assets/images/home-img/tenses.png',
              backgroundColor: kSlatePurple,
              onTap: () => Get.toNamed(AppRoutes.tenses),
            ),
            MenuOptionData(
              title: 'Conversation',
              urduText: 'مکالمہ',
              assetPath: 'assets/images/home-img/convo.png',
              backgroundColor: kPurple,
              onTap: () => Get.toNamed(AppRoutes.conversation),
            ),
            MenuOptionData(
              title: 'Dictionary',
              urduText: 'لغت',
              assetPath: 'assets/images/home-img/dictionary.png',
              backgroundColor: kAquaBlue,
              onTap: () => Get.toNamed(AppRoutes.dictionary),
            ),
          ];

          return Stack(
            children: [
              Positioned.fill(
                child: Transform.translate(
                  offset: Offset(-width * 0.55, 0),
                  child: CustomPaint(
                    painter: EllipseBorderPainter(strokeWidth: width * 0.14),
                  ),
                ),
              ),
              for (int i = 0; i < options.length; i++)
                Positioned(
                  top: startingTop + (i * height * 0.135),
                  left: getLeftOffset(i),
                  child: MenuOptionRow(
                    title: options[i].title,
                    subtitle: options[i].subtitle,
                    urduText: options[i].urduText,
                    assetPath: options[i].assetPath,
                    backgroundColor: options[i].backgroundColor,
                    onTap: options[i].onTap,
                  ),
                ),
              Positioned(
                top: height * 0.35,
                left: width * 0.05,
                child: Opacity(
                  opacity: 0.24,
                  child: Image.asset(
                    'assets/images/home-img/black_board.png',
                    width: width * 0.3,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MenuOptionData {
  final String title;
  final String? subtitle;
  final String urduText;
  final String assetPath;
  final Color backgroundColor;
  final VoidCallback onTap;

  MenuOptionData({
    required this.title,
    this.subtitle,
    required this.urduText,
    required this.assetPath,
    required this.backgroundColor,
    required this.onTap,
  });
}

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
