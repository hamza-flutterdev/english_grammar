import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/speak_button.dart';
import '../controller/grammar_categories_controller.dart';

class GrammarCategoriesView extends StatelessWidget {
  const GrammarCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryName = Get.arguments['categoryName'];
    final items = List<Map<String, dynamic>>.from(Get.arguments['items']);
    final GrammarCategoriesController controller = Get.put(
      GrammarCategoriesController(items: items),
      tag: categoryName,
    );

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: categoryName),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            if (controller.items.isNotEmpty)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: kElementWidthGap,
                ),
                child: Card(
                  color: primaryColor,
                  elevation: 4,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconActionButton(
                              onTap: () {
                                final urduText =
                                    controller.items.first['urdu_words']
                                        ?.toString() ??
                                    '';
                                final englishText =
                                    controller.items.first['english_words']
                                        ?.toString() ??
                                    '';
                                final textToCopy = '$englishText\n$urduText';
                                Clipboard.setData(
                                  ClipboardData(text: textToCopy),
                                );
                              },
                              icon: Icons.copy,
                              color: kWhite,
                              size: secondaryIcon(context),
                            ),
                            SpeakButton(
                              textToSpeak:
                                  controller.items.first['english_words']
                                              ?.toString()
                                              .isNotEmpty ==
                                          true
                                      ? controller.items.first['english_words']
                                          .toString()
                                      : 'No phrase',
                              color: kWhite,
                              size: secondaryIcon(context),
                            ),
                          ],
                        ),
                        Text(
                          controller.items.first['english_words']?.toString() ??
                              '',
                          style: titleMediumStyle.copyWith(color: kWhite),
                        ),
                        SizedBox(width: kElementWidthGap),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconActionButton(
                              onTap: controller.toggleUrdu,
                              icon: Icons.arrow_drop_down,
                              color: kWhite,
                              size: secondaryIcon(context),
                            ),
                          ],
                        ),
                        const SizedBox(height: kElementInnerGap),
                        if (controller.showUrdu.value)
                          Padding(
                            padding: const EdgeInsets.only(
                              right: kElementWidthGap,
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                controller.items.first['urdu_words']
                                        ?.toString() ??
                                    '',
                                textAlign: TextAlign.right,
                                style: urduBodyLargeStyle.copyWith(
                                  color: kWhite,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    contentPadding: kContentPaddingSmall,
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kBodyHp),
                child: ListView.builder(
                  itemCount:
                      controller.items.length > 1
                          ? controller.items.length - 1
                          : 0,
                  itemBuilder: (context, index) {
                    final actualIndex = index + 1;
                    final item = controller.items[actualIndex];
                    final urduText = item['urdu_words']?.toString() ?? '';
                    final englishText = item['english_words']?.toString() ?? '';
                    final textToSpeak =
                        englishText.isNotEmpty ? englishText : 'No phrase';
                    return Card(
                      color: primaryColor,
                      elevation: 2,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    final textToCopy =
                                        '$englishText\n$urduText';
                                    Clipboard.setData(
                                      ClipboardData(text: textToCopy),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.copy,
                                    color: kWhite,
                                    size: secondaryIcon(context),
                                  ),
                                ),
                                SpeakButton(
                                  textToSpeak: textToSpeak,
                                  color: kWhite,
                                  size: secondaryIcon(context),
                                ),
                              ],
                            ),
                            Text(
                              englishText,
                              style: titleMediumStyle.copyWith(color: kWhite),
                            ),
                            const SizedBox(height: kElementInnerGap),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: kElementWidthGap,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  urduText,
                                  textAlign: TextAlign.right,
                                  style: urduBodyLargeStyle.copyWith(
                                    color: kWhite,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        contentPadding: kContentPaddingSmall,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
