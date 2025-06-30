import 'package:english_grammer/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/speak_button.dart';
import '../controller/vocabulory_category_controller.dart';

class VocabularyCategoryView extends StatelessWidget {
  const VocabularyCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments as String;
    final controller = Get.put(VocabularyCategoryController());

    controller.loadWords(title);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: title),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: EdgeInsets.all(kBodyHp),
          itemCount: controller.words.length,
          itemBuilder: (context, index) {
            final word = controller.words[index];
            return Card(
              color: primaryColor,
              elevation: 2,
              margin: kVerticalMargin,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        word['urdu_words']?.toString() ?? '',
                        textAlign: TextAlign.right,
                        style: titleSmallBoldStyle.copyWith(color: kWhite),
                      ),
                    ),
                    const SizedBox(height: kElementInnerGap),
                    Text(
                      word['english_words'] ?? '',
                      style: titleSmallStyle.copyWith(color: kWhite),
                    ),
                  ],
                ),
                trailing: SpeakButton(
                  textToSpeak: word['english_words']?.toString() ?? 'No phrase',
                  color: kWhite,
                  size: secondaryIcon(context),
                ),
                contentPadding: kContentPaddingSmall,
              ),
            );
          },
        );
      }),
    );
  }
}
