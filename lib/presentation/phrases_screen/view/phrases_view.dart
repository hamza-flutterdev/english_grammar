import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/widgets/text_widget.dart';
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
        useBackButton: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: kBodyHp),
            child: Text(
              'جملے',
              style: context.textTheme.titleLarge?.copyWith(color: kWhite),
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
                return Container(
                  decoration: roundedDecoration.copyWith(color: secondaryColor),
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: RadioListTile<int>(
                    value: index,
                    groupValue: index,
                    onChanged: (int? value) {
                      // Handle radio button here
                    },
                    activeColor: Colors.teal,

                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${index + 1}.',
                              style: context.textTheme.titleLarge?.copyWith(
                                color: kWhite,
                              ),
                            ),
                            SizedBox(width: 8),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                category['english_words'] ?? ''.toString(),
                                style: context.textTheme.titleLarge?.copyWith(
                                  color: kWhite,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              category['urdu_words'] ?? ''.toString(),
                              style: context.textTheme.titleLarge?.copyWith(
                                color: kWhite,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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
