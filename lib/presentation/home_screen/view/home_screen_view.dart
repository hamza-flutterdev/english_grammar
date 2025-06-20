import 'package:english_grammer/core/constants/app_strings.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/widgets/menu_option_row.dart';
import 'package:english_grammer/presentation/conversation/view/conversation_view.dart';
import 'package:english_grammer/presentation/dictionary_screen/view/dictionary_screen_view.dart';
import 'package:english_grammer/presentation/grammar_screen/view/grammar_screen_view.dart';
import 'package:english_grammer/presentation/vocabulary_screen/view/vocabulary_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../alphabet_screen/view/alphabet_screen_view.dart';
import '../../phrases_screen/view/phrases_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileHeight = MediaQuery.of(context).size.height;
    final mobileWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: AppString.homeBar, useBackButton: false),
      body: Stack(
        children: [
          // Background ellipse
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(-mobileWidth * 0.3, 0),
              child: Image.asset(
                'assets/images/ellipse.png',
                color: secondaryColor,
              ),
            ),
          ),

          // Vocabulary (Category wise)
          Positioned(
            top: mobileHeight * 0.1,
            left: mobileWidth * 0.1,
            child: MenuOptionRow(
              title: 'Vocabulary',
              subtitle: '(Category wise)',
              urduText: 'ذخیرہ الفاظ',
              assetPath: 'assets/images/vocabulary.png',
              backgroundColor: kBrightTeal,
              onTap: () {
                Get.to(VocabularyView());
              },
            ),
          ),

          // Vocabulary (Alphabetical Order)
          Positioned(
            top: mobileHeight * 0.22,
            left: mobileWidth * 0.32,
            child: MenuOptionRow(
              title: 'Vocabulary',
              subtitle: '(Alphabetical Order)',
              urduText: 'ذخیرہ الفاظ',
              assetPath: 'assets/images/alphabet.png',
              backgroundColor: kWarmGold,
              onTap: () {
                Get.to(AlphabetScreenView());
              },
            ),
          ),

          // Phrases
          Positioned(
            top: mobileHeight * 0.34,
            left: mobileWidth * 0.44,
            child: MenuOptionRow(
              title: 'Phrases',
              urduText: 'جملے',
              assetPath: 'assets/images/phrases.png',
              backgroundColor: kMintGreen,
              onTap: () {
                Get.to(PhrasesCategoryScreen());
              },
            ),
          ),
          // Grammar
          Positioned(
            top: mobileHeight * 0.48,
            left: mobileWidth * 0.42,
            child: MenuOptionRow(
              title: 'Grammar',
              urduText: 'گرامر',
              assetPath: 'assets/images/grammar.png',
              backgroundColor: kCoral,
              onTap: () {
                Get.to(GrammarView());
              },
            ),
          ),

          // Conversation
          Positioned(
            top: mobileHeight * 0.60,
            left: mobileWidth * 0.30,
            child: MenuOptionRow(
              title: 'Conversation',
              urduText: 'مکالمہ',
              assetPath: 'assets/images/convo.png',
              backgroundColor: kPurple,
              onTap: () {
                Get.to(ConversationView());
              },
            ),
          ),

          // Tenses - Bottom Center, at ellipse edge
          Positioned(
            top: mobileHeight * 0.70,
            left: mobileWidth * 0.1,
            child: MenuOptionRow(
              title: 'Dictionary',
              urduText: 'لغت',
              assetPath: 'assets/images/dictionary.png',
              backgroundColor: kAquaBlue,
              onTap: () {
                Get.to(DictionarySearchScreen());
              },
            ),
          ),

          // Decorative blackboard
          Positioned(
            top: mobileHeight * 0.35,
            left: mobileWidth * 0.001,
            child: Opacity(
              opacity: 0.24,
              child: Image.asset(
                'assets/images/black_board.png',
                width: mobileWidth * 0.4,
                height: mobileWidth * 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
