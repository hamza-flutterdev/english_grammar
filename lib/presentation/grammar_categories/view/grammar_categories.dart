import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/speak_button.dart';
import '../controller/grammar_categories_controller.dart';

class GrammarDetailView extends StatelessWidget {
  const GrammarDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryName = Get.arguments['categoryName'];
    final items = List<Map<String, dynamic>>.from(Get.arguments['items']);
    final GrammarDetailController controller = Get.put(
      GrammarDetailController(items: items),
      tag: categoryName,
    );

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: categoryName),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(kBodyHp),
          child: ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              final item = controller.items[index];
              final urduText = item['urdu_words']?.toString() ?? '';
              final englishText = item['english_words']?.toString() ?? '';
              final textToSpeak =
                  englishText.isNotEmpty ? englishText : 'No phrase';

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: roundedPrimaryBorderDecoration,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          urduText,
                          textAlign: TextAlign.right,
                          style: titleSmallBoldStyle.copyWith(color: kWhite),
                        ),
                      ),
                      const SizedBox(height: kElementInnerGap),
                      Text(
                        englishText,
                        style: titleSmallStyle.copyWith(color: kWhite),
                      ),
                    ],
                  ),
                  trailing: SpeakButton(
                    textToSpeak: textToSpeak,
                    color: kWhite,
                    size: secondaryIcon(context),
                  ),
                  contentPadding: kContentPadding,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
