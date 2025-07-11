import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/speak_button.dart';
import '../../../core/widgets/section_header.dart';
import '../controller/tenses_categories_controller.dart';

class TensesCategoriesView extends StatelessWidget {
  const TensesCategoriesView({super.key});

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

              return Column(
                children: [
                  if (index == 0) SectionHeader(title: 'Definition'),
                  if (controller.indexLabels.containsKey(index))
                    SectionHeader(title: controller.indexLabels[index]!),
                  Card(
                    color: primaryColor.withValues(alpha: 0.7),
                    elevation: 2,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            category['english_words']?.toString() ?? '',
                            style: titleSmallBoldStyle.copyWith(color: kWhite),
                          ),
                          const SizedBox(height: kElementInnerGap),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              category['urdu_words']?.toString() ?? '',
                              textAlign: TextAlign.right,
                              style: urduBodyLargeStyle.copyWith(color: kWhite),
                            ),
                          ),
                        ],
                      ),
                      trailing: SpeakButton(
                        textToSpeak:
                            category['english_words']?.toString() ?? 'No text',
                        color: kWhite,
                        size: secondaryIcon(context),
                      ),
                      contentPadding: kContentPaddingSmall,
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
