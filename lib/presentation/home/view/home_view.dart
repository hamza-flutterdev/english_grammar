import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/widgets/menu_option_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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

          const topPadding = 16.0;
          final remainingHeight = height - topPadding;
          final itemHeight = remainingHeight / 7;

          /*
          keep it in common because this
          is use ahead
          */

          double getLeftOffset(int index) {
            if (isWide) {
              return [0.10, 0.30, 0.42, 0.47, 0.44, 0.34, 0.14][index] * width;
            } else if (isMedium) {
              return [0.08, 0.32, 0.43, 0.47, 0.45, 0.36, 0.14][index] * width;
            } else {
              return [0.10, 0.32, 0.42, 0.47, 0.42, 0.32, 0.14][index] * width;
            }
          }

          final options = [
            _MenuOptionData(
              title: 'Vocabulary',
              subtitle: '(Category wise)',
              urduText: 'ذخیرہ الفاظ',
              assetPath: 'assets/images/home-img/vocabulary.png',
              backgroundColor: kBrightTeal,
              onTap: () => Get.toNamed(AppRoutes.vocabulary),
            ),
            _MenuOptionData(
              title: 'Vocabulary',
              subtitle: '(Alphabetical Order)',
              urduText: 'ذخیرہ الفاظ',
              assetPath: 'assets/images/home-img/alphabet.png',
              backgroundColor: kWarmGold,
              onTap: () => Get.toNamed(AppRoutes.alphabet),
            ),
            _MenuOptionData(
              title: 'Phrases',
              urduText: 'جملے',
              assetPath: 'assets/images/home-img/phrases.png',
              backgroundColor: kMintGreen,
              onTap: () => Get.toNamed(AppRoutes.phrases),
            ),
            _MenuOptionData(
              title: 'Grammar',
              urduText: 'گرامر',
              assetPath: 'assets/images/home-img/grammar.png',
              backgroundColor: kCoral,
              onTap: () => Get.toNamed(AppRoutes.grammar),
            ),
            _MenuOptionData(
              title: 'Tenses',
              urduText: 'زمانے',
              assetPath: 'assets/images/home-img/tenses.png',
              backgroundColor: kSlatePurple,
              onTap: () => Get.toNamed(AppRoutes.tenses),
            ),
            _MenuOptionData(
              title: 'Conversation',
              urduText: 'مکالمہ',
              assetPath: 'assets/images/home-img/convo.png',
              backgroundColor: kPurple,
              onTap: () => Get.toNamed(AppRoutes.conversation),
            ),
            _MenuOptionData(
              title: 'Dictionary',
              urduText: 'لغت',
              assetPath: 'assets/images/home-img/dictionary.png',
              backgroundColor: kAquaBlue,
              onTap: () => Get.toNamed(AppRoutes.dictionary),
            ),
          ];


          /*
          Create a stateless class for this
          for correct harrier.
          */
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
                  top: topPadding + (i * itemHeight),
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

class _MenuOptionData {
  final String title;
  final String? subtitle;
  final String urduText;
  final String assetPath;
  final Color backgroundColor;
  final VoidCallback onTap;

  _MenuOptionData({
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
