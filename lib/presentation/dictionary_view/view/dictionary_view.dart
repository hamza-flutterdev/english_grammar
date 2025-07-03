import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/icon_buttons.dart';
import '../../../core/widgets/search_bar.dart';
import '../../../core/widgets/speak_button.dart';
import '../controller/dictionary_controller.dart';
import 'detail_section.dart';

class DictionaryView extends StatelessWidget {
  const DictionaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DictionaryController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: 'Dictionary'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kBodyHp),
              child: SearchBarField(
                controller: controller.searchController,
                onSearch: (query) {
                  controller.performSearch(context, query);
                },
                fontFamily: fontSecondary,
                textColor: textGreyColor,
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.selectedWord.isNotEmpty &&
                    controller.selectedMeaning.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(kBodyHp),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(kBodyHp),
                            decoration: roundedPrimaryBorderDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.menu_book_rounded,
                                          color: kBlack,
                                          size: secondaryIcon(context),
                                        ),
                                        const SizedBox(width: kElementWidthGap),
                                        Text(
                                          'Word:',
                                          style: titleSmallBoldStyle,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SpeakButton(
                                          textToSpeak:
                                              controller.selectedMeaning.value,
                                          color: kBlack,
                                          size: secondaryIcon(context),
                                        ),

                                        const SizedBox(width: kElementWidthGap),
                                        Tooltip(
                                          message: 'Copy All',
                                          child: IconActionButton(
                                            onTap:
                                                () => controller.copyToClipboard(
                                                  '${controller.selectedMeaning.value}\n'
                                                  '${controller.selectedWord.value}\n\n'
                                                  '${controller.aiResponse.value}',
                                                ),
                                            icon: Icons.copy,
                                            color: kBlack,
                                            size: secondaryIcon(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: kElementGap),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'English:',
                                      style: titleSmallBoldStyle,
                                    ),
                                    const SizedBox(width: kElementWidthGap),
                                    Expanded(
                                      child: Text(
                                        controller.selectedMeaning.value,
                                        style: titleBoldMediumStyle.copyWith(
                                          color: textGreyColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: kElementInnerGap),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Urdu:', style: titleSmallBoldStyle),
                                    const SizedBox(width: kElementInnerGap),
                                    Expanded(
                                      child: Text(
                                        controller.selectedWord.value,
                                        textDirection: TextDirection.rtl,
                                        style: urduBodyLargeStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: kElementGap),
                          if (controller.isLoadingAiDetails.value) ...[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(kBodyHp),
                              decoration: roundedPrimaryBorderDecoration,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: kBodyHp,
                                    height: kBodyHp,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: kBlack,
                                    ),
                                  ),
                                  const SizedBox(width: kElementWidthGap),
                                  Text(
                                    'Analyzing word...',
                                    style: bodyBoldSmallStyle,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: kElementGap),
                          ],
                          if (!controller.isLoadingAiDetails.value &&
                              controller.wordDetails.value != null) ...[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(kBodyHp),
                              decoration: roundedPrimaryBorderDecoration,
                              child: Column(
                                children: [
                                  const SizedBox(height: kElementGap),
                                  // Definition
                                  WordDetailSection(
                                    controller: controller,
                                    title: 'Definition',
                                    content:
                                        controller
                                            .wordDetails
                                            .value!
                                            .definition,
                                  ),
                                  const SizedBox(height: kElementGap),
                                  // Part of Speech
                                  WordDetailSection(
                                    controller: controller,
                                    title: 'Part of Speech',
                                    content:
                                        controller
                                            .wordDetails
                                            .value!
                                            .partOfSpeech,
                                  ),
                                  const SizedBox(height: kElementGap),
                                  // Pronunciation
                                  WordDetailSection(
                                    controller: controller,
                                    title: 'Pronunciation',
                                    content:
                                        controller
                                            .wordDetails
                                            .value!
                                            .pronunciation,
                                  ),
                                  const SizedBox(height: kElementGap),
                                  // Examples
                                  WordDetailSection(
                                    controller: controller,
                                    title: 'Examples',
                                    content:
                                        controller.wordDetails.value!.examples,
                                  ),
                                  const SizedBox(height: kElementGap),
                                  // Synonyms
                                  WordDetailSection(
                                    controller: controller,
                                    title: 'Synonyms',
                                    content:
                                        controller.wordDetails.value!.synonyms,
                                  ),
                                  const SizedBox(height: kElementGap),
                                  // Antonyms
                                  WordDetailSection(
                                    controller: controller,
                                    title: 'Antonyms',
                                    content:
                                        controller.wordDetails.value!.antonyms,
                                  ),
                                  const SizedBox(height: kElementGap),
                                ],
                              ),
                            ),
                          ],
                          if (!controller.isLoadingAiDetails.value &&
                              controller.aiError.isNotEmpty) ...[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(kBodyHp),
                              decoration: roundedPrimaryBorderDecoration,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: kRed.withValues(alpha: 0.7),
                                    size: secondaryIcon(context),
                                  ),
                                  const SizedBox(width: kElementWidthGap),
                                  Expanded(
                                    child: Text(
                                      controller.aiError.value,
                                      style: bodyBoldSmallStyle.copyWith(
                                        color: kRed.withValues(alpha: 0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          if (!controller.isLoadingAiDetails.value &&
                              controller.aiResponse.isEmpty &&
                              controller.aiError.isEmpty) ...[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(kBodyHp),
                              decoration: roundedPrimaryBorderDecoration,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.tips_and_updates_outlined,
                                    color: kBlack,
                                    size: secondaryIcon(context),
                                  ),
                                  const SizedBox(width: kElementWidthGap),
                                  Expanded(
                                    child: Text(
                                      'Auto-generating detailed analysis...',
                                      style: bodyBoldSmallStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: kElementGap),
                          ],
                        ],
                      ),
                    ),
                  );
                } else {
                  if (!controller.hasSearched.value) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: primaryIcon(context),
                            color: kBlack,
                          ),
                          const SizedBox(height: kElementGap),
                          Text(
                            'Start typing to search for words',
                            style: bodySmallStyle,
                          ),
                        ],
                      ),
                    );
                  }
                  if (controller.isSearching.value) {
                    return const Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    );
                  }
                  if (controller.searchResults.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: primaryIcon(context),
                            color: kRed.withValues(alpha: 0.75),
                          ),
                          const SizedBox(height: kElementGap),
                          Text(
                            'No results found',
                            style: bodySmallStyle.copyWith(
                              color: kRed.withValues(alpha: 0.75),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(kBodyHp),
                    child: Container(
                      padding: const EdgeInsets.all(kElementGap),
                      decoration: roundedPrimaryBorderDecoration,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.searchResults.length,
                        itemBuilder: (context, index) {
                          final item = controller.searchResults[index];
                          final word = item['word'] ?? '';
                          final meaning = item['meaning'] ?? 'No meaning found';
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:
                                    () => controller.onWordTap(word, meaning),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(meaning, style: titleMediumStyle),
                                    const SizedBox(height: kElementInnerGap),

                                    Text(
                                      word,
                                      textAlign: TextAlign.right,
                                      style: urduBodyLargeStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: kBlack.withValues(alpha: 0.3),
                                height: mobileHeight(context) * 0.025,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
