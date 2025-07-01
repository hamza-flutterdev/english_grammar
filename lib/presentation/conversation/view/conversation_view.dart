import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/horiz_progress.dart';
import 'package:english_grammer/core/widgets/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/bg_circle.dart';
import '../../../core/widgets/common_drop_down.dart';
import '../controller/conversation_controller.dart';

class ConversationView extends StatelessWidget {
  final ConversationController controller = Get.put(ConversationController());

  ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories =
        controller.sections.expand((section) => section.categories).toList();

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          const AppbarCircle(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconActionButton(
                      onTap: Get.back,
                      icon: Icons.arrow_back_ios_new,
                      color: kWhite,
                    ),
                    SizedBox(width: mobileWidth(context) * 0.25),
                    Text(
                      'Conversation',
                      style: titleBoldMediumStyle.copyWith(color: kWhite),
                    ),
                  ],
                ),
                SizedBox(height: kBodyHp),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kBodyHp * 2),
                  child: Text(
                    'Conversation',
                    style: headlineMediumStyle.copyWith(color: kWhite),
                  ),
                ),
                SizedBox(height: kElementGap),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kBodyHp * 2),
                  child: Obx(
                    () => Container(
                      padding: kContentPaddingSmall,
                      decoration: roundedPrimaryBorderDecoration.copyWith(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: CommonDropDown<String>(
                        value: controller.selectedCategory.value,
                        items: categories,
                        onChanged: (String? selectedValue) {
                          if (selectedValue != null) {
                            controller.selectedCategory.value = selectedValue;
                            Get.toNamed(
                              AppRoutes.conversationCategory,
                              arguments: selectedValue,
                            );
                          }
                        },
                        itemBuilder: (String category) => category,
                        textStyle: bodyLargeStyle.copyWith(color: kWhite),
                        maxHeight: 200.0,
                        dropdownColor: primaryColor.withValues(alpha: 0.7),
                        iconColor: kWhite,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: mobileHeight(context) * 0.02),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(kBodyHp),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final iconContainer = controller.categoryIcons[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.conversationCategory,
                              arguments: category,
                            );
                          },
                          child: Container(
                            decoration: roundedDecorationWithShadow,
                            padding: const EdgeInsets.all(kElementInnerGap),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: kBodyHp),
                                ImageActionButton(
                                  backgroundColor: secondaryColor,
                                  isCircular: true,
                                  size: primaryIcon(context),
                                  color: iconContainer.color,
                                  assetPath: iconContainer.assetImage,
                                ),
                                const SizedBox(height: kElementInnerGap),
                                Text(
                                  category,
                                  style: bodyBoldMediumStyle,
                                  textAlign: TextAlign.center,
                                ),
                                const Spacer(),
                                Container(
                                  decoration: roundedPrimaryBorderDecoration
                                      .copyWith(
                                        color: primaryColor.withValues(
                                          alpha: 0.2,
                                        ),
                                      ),
                                  width: double.infinity,
                                  padding: kContentPaddingSmall,
                                  child: Obx(
                                    () => HorizontalProgress(
                                      currentStep: controller.getCurrentStep(
                                        category,
                                      ),
                                      totalSteps:
                                          ConversationController
                                              .totalProgressSteps,
                                      selectedColor: iconContainer.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: kBodyHp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
