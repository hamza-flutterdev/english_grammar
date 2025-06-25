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
      body: Stack(
        children: [
          // Background ellipse
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(-mobileWidth(context) * 0.32, 0),
              child: Image.asset(
                'assets/images/home-img/ellipse.png',
                color: primaryColor,
              ),
            ),
          ),

          // Vocabulary (Category wise)
          Positioned(
            top: mobileHeight(context) * 0.06,
            left: mobileWidth(context) * 0.14,
            child: MenuOptionRow(
              title: 'Vocabulary',
              subtitle: '(Category wise)',
              urduText: 'ذخیرہ الفاظ',
              assetPath: 'assets/images/home-img/vocabulary.png',
              backgroundColor: kBrightTeal,
              onTap: () {
                Get.toNamed(AppRoutes.vocabulary);
              },
            ),
          ),

          // Vocabulary (Alphabetical Order)
          Positioned(
            top: mobileHeight(context) * 0.16,
            left: mobileWidth(context) * 0.32,
            child: MenuOptionRow(
              title: 'Vocabulary',
              subtitle: '(Alphabetical Order)',
              urduText: 'ذخیرہ الفاظ',
              assetPath: 'assets/images/home-img/alphabet.png',
              backgroundColor: kWarmGold,
              onTap: () {
                Get.toNamed(AppRoutes.alphabet);
              },
            ),
          ),

          // Phrases
          Positioned(
            top: mobileHeight(context) * 0.28,
            left: mobileWidth(context) * 0.41,
            child: MenuOptionRow(
              title: 'Phrases',
              urduText: 'جملے',
              assetPath: 'assets/images/home-img/phrases.png',
              backgroundColor: kMintGreen,
              onTap: () {
                Get.toNamed(AppRoutes.phrases);
              },
            ),
          ),
          // Grammar
          Positioned(
            top: mobileHeight(context) * 0.40,
            left: mobileWidth(context) * 0.42,
            child: MenuOptionRow(
              title: 'Grammar',
              urduText: 'گرامر',
              assetPath: 'assets/images/home-img/grammar.png',
              backgroundColor: kCoral,
              onTap: () {
                Get.toNamed(AppRoutes.grammar);
              },
            ),
          ),
          // Tenses
          Positioned(
            top: mobileHeight(context) * 0.52,
            left: mobileWidth(context) * 0.38,
            child: MenuOptionRow(
              title: 'Tenses',
              urduText: 'زمانے',
              assetPath: 'assets/images/home-img/tenses.png',
              backgroundColor: kSlatePurple,
              onTap: () {
                Get.toNamed(AppRoutes.tenses);
              },
            ),
          ),
          // Conversation
          Positioned(
            top: mobileHeight(context) * 0.62,
            left: mobileWidth(context) * 0.24,
            child: MenuOptionRow(
              title: 'Conversation',
              urduText: 'مکالمہ',
              assetPath: 'assets/images/home-img/convo.png',
              backgroundColor: kPurple,
              onTap: () {
                Get.toNamed(AppRoutes.conversation);
              },
            ),
          ),

          // Dictionary
          Positioned(
            top: mobileHeight(context) * 0.71,
            left: mobileWidth(context) * 0.08,
            child: MenuOptionRow(
              title: 'Dictionary',
              urduText: 'لغت',
              assetPath: 'assets/images/home-img/dictionary.png',
              backgroundColor: kAquaBlue,
              onTap: () {
                Get.toNamed(AppRoutes.dictionary);
              },
            ),
          ),

          // Decorative blackboard
          Positioned(
            top: mobileHeight(context) * 0.35,
            left: mobileWidth(context) * 0.05,
            child: Opacity(
              opacity: 0.24,
              child: Image.asset(
                'assets/images/home-img/black_board.png',
                width: mobileWidth(context) * 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
