import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/speak_button.dart';
import '../controller/phrases_controller.dart';

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhrasesController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: 'English Phrases'),
      body: Padding(
        padding: EdgeInsets.all(kBodyHp),
        child: Obx(() {
          if (controller.categories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final phraseCategories =
              controller.categories
                  .where((category) => category['category_name'] == 'Phrases')
                  .toList();

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: phraseCategories.length,
                  itemBuilder: (context, index) {
                    final category = phraseCategories[index];
                    return Card(
                      color: primaryColor,
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
                              category['english_words']?.toString() ??
                              'No phrase',
                          color: kWhite,
                          size: secondaryIcon(context),
                        ),
                        contentPadding: kContentPadding,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: kBodyHp),
            ],
          );
        }),
      ),
    );
  }
}
