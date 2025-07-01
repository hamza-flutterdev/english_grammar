import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/speak_button.dart';
import '../controller/phrases_controller.dart';

class PhrasesView extends StatelessWidget {
  const PhrasesView({super.key});

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
                            Text(
                              category['english_words']?.toString() ?? '',
                              style: titleMediumStyle.copyWith(color: kWhite),
                            ),
                            const SizedBox(height: kElementInnerGap),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                category['urdu_words']?.toString() ?? '',
                                textAlign: TextAlign.right,
                                style: urduBodyLargeStyle.copyWith(
                                  color: kWhite,
                                ),
                              ),
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
                        contentPadding: kContentPaddingSmall,
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
