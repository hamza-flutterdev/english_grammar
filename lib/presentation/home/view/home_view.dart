import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/widgets/menu_option_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../controller/home_controller.dart';
import 'ellipse.dart';
import 'elliptical_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return WillPopScope(
      onWillPop: () async {
        bool? exit = await PanaraConfirmDialog.show(
          context,
          title: "Exit App?",
          message: "Do you really want to exit the app?",
          confirmButtonText: "Exit",
          cancelButtonText: "Cancel",
          onTapCancel: () => Navigator.pop(context, false),
          onTapConfirm: () => Navigator.pop(context, true),
          panaraDialogType: PanaraDialogType.normal,
          barrierDismissible: false,
        );
        return exit ?? false;
      },
      child: Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: bgColor,
        appBar: CustomAppBar(
          subtitle: 'English Learning',
          useBackButton: false,
        ),
        body: SafeArea(child: const HomeMenuLayout()),
      ),
    );
  }
}

class HomeMenuLayout extends StatelessWidget {
  const HomeMenuLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final isWide = width > 450;
        final isMedium = width > 360;
        const topPadding = kBodyHp;
        final remainingHeight = height - topPadding;
        final itemHeight = remainingHeight / 7;

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
            Obx(
              () => Positioned.fill(
                child: Transform.translate(
                  offset: Offset(-width * 0.72, 0),
                  child: CustomPaint(
                    painter: EllipticalTextPainter(
                      texts: controller.titles,
                      rotation: controller.rotation.value,
                    ),
                  ),
                ),
              ),
            ),
            for (int i = 0; i < options.length; i++)
              Positioned(
                top: topPadding + (i * itemHeight),
                left: _MenuLayoutHelper.getLeftOffset(
                  i,
                  width,
                  isWide,
                  isMedium,
                ),
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
    );
  }
}

class _MenuLayoutHelper {
  static double getLeftOffset(
    int index,
    double width,
    bool isWide,
    bool isMedium,
  ) {
    if (isWide) {
      return [0.10, 0.30, 0.42, 0.47, 0.44, 0.34, 0.14][index] * width;
    } else if (isMedium) {
      return [0.08, 0.32, 0.43, 0.47, 0.45, 0.36, 0.14][index] * width;
    } else {
      return [0.10, 0.32, 0.42, 0.47, 0.42, 0.32, 0.14][index] * width;
    }
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
