import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../controller/phrases_controller.dart';

class PhrasesCategoryScreen extends StatelessWidget {
  const PhrasesCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PhrasesController controller = Get.put(PhrasesController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        subtitle: 'English Phrases',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: kBodyHp),
            child: Text(
              'جملے',
              style: titleBoldLargeStyle.copyWith(color: kWhite),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(kBodyHp),
        child: Obx(() {
          if (controller.categories.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            final filteredList =
                controller.categories.where((category) {
                  return category['category_name'] == 'Phrases';
                }).toList();

            return ListView.builder(
              shrinkWrap: true,
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final category = filteredList[index];
                return Card(
                  color: primaryColor,
                  elevation: 2,
                  margin: kCardMargin,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Text(
                                category['urdu_words'] ?? ''.toString(),
                                textAlign: TextAlign.right,
                                style: titleSmallBoldStyle.copyWith(
                                  color: kWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: kElementInnerGap),
                        Flexible(
                          child: Text(
                            category['english_words'] ?? ''.toString(),
                            style: titleSmallStyle?.copyWith(color: kWhite),
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.play_circle,
                      color: kWhite,
                      size: secondaryIcon(context),
                    ),
                    contentPadding: kContentPadding,
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
