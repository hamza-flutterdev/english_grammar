import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/icon_buttons.dart';
import '../../../core/widgets/search_bar.dart';
import '../controller/dictionary_controller.dart';
import 'detail_section.dart';

class DictionarySearchScreen extends StatelessWidget {
  const DictionarySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DictionaryController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: 'Dictionary'),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(kBodyHp),
            child: SearchBarField(
              controller: controller.searchController,
              onSearch: controller.performSearch,
            ),
          ),

          // Content area
          Expanded(
            child: Obx(() {
              // Show word details if a word is selected
              if (controller.selectedWord.isNotEmpty &&
                  controller.selectedMeaning.isNotEmpty) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: kBodyHp),
                  child: Column(
                    children: [
                      // Basic word information container
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(kBodyHp),
                        decoration: roundedPrimaryBorderDecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: kWhite,
                                      size: secondaryIcon(context),
                                    ),
                                    const SizedBox(width: kElementWidthGap),
                                    Text(
                                      'Word:',
                                      style: bodyBoldMediumStyle.copyWith(
                                        color: kWhite,
                                      ),
                                    ),
                                  ],
                                ),

                                // Right side: Two action buttons
                                Row(
                                  children: [
                                    Tooltip(
                                      message: 'Speak Word',
                                      child: IconActionButton(
                                        onTap: () {},
                                        icon: Icons.play_circle,
                                        color: kWhite,
                                        size: secondaryIcon(context),
                                      ),
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
                                        color: kWhite,
                                        size: secondaryIcon(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: kElementGap),

                            // English and Urdu words
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'English:',
                                  style: bodyBoldSmallStyle.copyWith(
                                    color: kWhite,
                                  ),
                                ),
                                const SizedBox(width: kElementWidthGap),
                                Expanded(
                                  child: Text(
                                    controller.selectedMeaning.value,
                                    style: bodySmallStyle.copyWith(
                                      color: kWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: kElementInnerGap),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Urdu:',
                                  style: bodyBoldSmallStyle.copyWith(
                                    color: kWhite,
                                  ),
                                ),
                                const SizedBox(width: kElementInnerGap),
                                Expanded(
                                  child: Text(
                                    controller.selectedWord.value,
                                    textDirection: TextDirection.rtl,
                                    style: bodySmallStyle.copyWith(
                                      color: kWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: kElementGap),

                      // Loading state
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
                                  color: kWhite,
                                ),
                              ),
                              const SizedBox(width: kElementWidthGap),
                              Text(
                                'Analyzing word...',
                                style: bodyBoldSmallStyle.copyWith(
                                  color: kWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: kElementGap),
                      ],
                      // Show parsed sections
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
                                    controller.wordDetails.value!.definition,
                              ),
                              const SizedBox(height: kElementGap),
                              // Part of Speech
                              WordDetailSection(
                                controller: controller,
                                title: 'Part of Speech',
                                content:
                                    controller.wordDetails.value!.partOfSpeech,
                              ),
                              const SizedBox(height: kElementGap),
                              // Pronunciation
                              WordDetailSection(
                                controller: controller,
                                title: 'Pronunciation',
                                content:
                                    controller.wordDetails.value!.pronunciation,
                              ),
                              const SizedBox(height: kElementGap),
                              // Examples
                              WordDetailSection(
                                controller: controller,
                                title: 'Examples',
                                content: controller.wordDetails.value!.examples,
                              ),
                              const SizedBox(height: kElementGap),
                              // Synonyms
                              WordDetailSection(
                                controller: controller,
                                title: 'Synonyms',
                                content: controller.wordDetails.value!.synonyms,
                              ),
                              const SizedBox(height: kElementGap),
                              // Antonyms
                              WordDetailSection(
                                controller: controller,
                                title: 'Antonyms',
                                content: controller.wordDetails.value!.antonyms,
                              ),
                              const SizedBox(height: kElementGap),
                            ],
                          ),
                        ),
                      ],
                      // Error state
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

                      // Initial state
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
                                color: kWhite,
                                size: secondaryIcon(context),
                              ),
                              const SizedBox(width: kElementWidthGap),
                              Expanded(
                                child: Text(
                                  'Auto-generating detailed analysis...',
                                  style: bodyBoldSmallStyle.copyWith(
                                    color: kWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: kElementGap),
                      ],
                    ],
                  ),
                );
              }
              // Show search results or search states
              else {
                if (!controller.hasSearched.value) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: primaryIcon(context),
                          color: kWhite,
                        ),
                        const SizedBox(height: kElementGap),
                        Text(
                          'Start typing to search for words',
                          style: bodySmallStyle.copyWith(color: kWhite),
                        ),
                      ],
                    ),
                  );
                }
                if (controller.isSearching.value) {
                  return const Center(
                    child: CircularProgressIndicator(color: kWhite),
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
                return ListView.builder(
                  itemCount: controller.searchResults.length,
                  itemBuilder: (context, index) {
                    final item = controller.searchResults[index];
                    final word = item['word'] ?? '';
                    final meaning = item['meaning'] ?? 'No meaning found';
                    return Card(
                      margin: kCardMargin,
                      color: primaryColor,
                      child: ListTile(
                        onTap: () => controller.onWordTap(word, meaning),
                        leading: const Icon(
                          Icons.menu_book_rounded,
                          color: kWhite,
                        ),
                        title: Text(
                          word,
                          textAlign: TextAlign.right,
                          style: bodyBoldMediumStyle.copyWith(color: kWhite),
                        ),
                        subtitle: Text(
                          meaning,
                          style: bodyBoldMediumStyle.copyWith(color: kWhite),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: kWhite,
                          size: secondaryIcon(context),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
