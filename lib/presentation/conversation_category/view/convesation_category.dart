import 'package:english_grammer/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/speak_button.dart';
import '../controller/conversation_category_controller.dart';

class ConversationCategoryView extends StatelessWidget {
  const ConversationCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments as String;
    final controller = Get.put(ConversationCategoryController());
    controller.loadConversations(title);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: title),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(kBodyHp),
                itemCount: controller.conversations.length,
                itemBuilder: (context, index) {
                  final conversation = controller.conversations[index];
                  final urduText = conversation['urdu_words']?.toString() ?? '';
                  final englishText =
                      conversation['english_words']?.toString() ?? '';

                  return Card(
                    color: primaryColor,
                    elevation: 2,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            englishText,
                            style: titleMediumStyle.copyWith(color: kWhite),
                          ),
                          const SizedBox(height: kElementInnerGap),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              urduText,
                              textAlign: TextAlign.right,
                              style: urduBodyLargeStyle.copyWith(color: kWhite),
                            ),
                          ),
                        ],
                      ),
                      trailing: SpeakButton(
                        textToSpeak:
                            englishText.isNotEmpty ? englishText : 'No phrase',
                        color: kWhite,
                        size: secondaryIcon(context),
                        onSpeakPressed:
                            () =>
                                controller
                                    .onSpeakButtonPressed(), // Increment speak count
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
    );
  }
}
