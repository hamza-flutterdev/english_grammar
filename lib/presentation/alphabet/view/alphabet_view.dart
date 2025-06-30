import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/search_bar.dart';
import '../../../core/widgets/speak_button.dart';
import '../controller/alphabet_controller.dart';

class AlphabetView extends StatelessWidget {
  AlphabetView({super.key});

  final AlphabetController controller = Get.put(AlphabetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomAppBar(subtitle: 'Alphabetical Order'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(kBodyHp),
            child: SearchBarField(
              controller: controller.searchController,
              onSearch: controller.performSearch,
              textColor: textGreyColor,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kBodyHp),
              child: Obx(() {
                if (controller.alphabetCateg.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                final filteredList =
                    controller.filteredAlphabetCateg
                        .where(
                          (category) =>
                              category['category_name'] == 'vocabulary2',
                        )
                        .toList();

                if (filteredList.isEmpty && controller.isSearching.value) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: primaryIcon(context),
                          color: kRed.withValues(alpha: 0.7),
                        ),
                        const SizedBox(height: kElementGap),
                        Text(
                          'No results found',
                          style: bodySmallStyle.copyWith(
                            color: kRed.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final category = filteredList[index];
                    final urdu = category['urdu_words']?.toString() ?? '';
                    final english = category['english_words']?.toString() ?? '';

                    return Card(
                      color: primaryColor,
                      elevation: 2,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              english,
                              style: titleSmallStyle.copyWith(color: kWhite),
                            ),

                            const SizedBox(height: kElementInnerGap),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                urdu,
                                textAlign: TextAlign.right,
                                style: titleSmallBoldStyle.copyWith(
                                  color: kWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: SpeakButton(
                          textToSpeak:
                              english.isNotEmpty ? english : 'No phrase',
                          color: kWhite,
                          size: secondaryIcon(context),
                        ),
                        contentPadding: kContentPaddingSmall,
                      ),
                    );
                  },
                );
              }),
            ),
          ),

          const SizedBox(height: kBodyHp),
        ],
      ),
    );
  }
}
