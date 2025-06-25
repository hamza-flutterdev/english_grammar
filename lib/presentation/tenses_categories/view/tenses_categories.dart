import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/speak_button.dart';
import '../../../core/widgets/section_header.dart';
import '../controller/tenses_categories_controller.dart';

class TensesCategoriesScreen extends StatelessWidget {
  const TensesCategoriesScreen({super.key});

  final Map<int, String> indexLabels = const {
    1: 'Affirmative Sentence',
    5: 'Negative Sentence',
    9: 'Interrogative Sentence',
  };

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments as String;
    final controller = Get.put(TensesCategoriesController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: title),
      body: Padding(
        padding: EdgeInsets.all(kBodyHp),
        child: Obx(() {
          if (controller.tensesCat.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final filteredList =
              controller.tensesCat.where((category) {
                return category['category_name'] == title;
              }).toList();

          return ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final category = filteredList[index];
              final englishText =
                  category['english_words']?.toLowerCase() ?? '';

              return Column(
                children: [
                  if (index == 0) SectionHeader(title: 'Definition'),
                  if (englishText.contains('subject'))
                    SectionHeader(
                      title: indexLabels[index] ?? 'Negative Sentences',
                    ),
                  Card(
                    color: primaryColor.withValues(alpha: 0.3),
                    elevation: 2,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              category['urdu_words']?.toString() ?? '',
                              textAlign: TextAlign.right,
                              style: titleSmallBoldStyle.copyWith(
                                color: kWhite,
                              ),
                            ),
                          ),
                          const SizedBox(height: kElementInnerGap),
                          Text(
                            category['english_words']?.toString() ?? '',
                            style: titleSmallStyle.copyWith(color: kWhite),
                          ),
                        ],
                      ),
                      trailing: SpeakButton(
                        textToSpeak:
                            category['english_words']?.toString() ?? 'No text',
                        color: kWhite,
                        size: secondaryIcon(context),
                      ),
                      contentPadding: kContentPadding,
                    ),
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
