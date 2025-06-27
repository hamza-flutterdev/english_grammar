import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/bg_circle.dart';
import '../../../routes/app_routes.dart';
import '../controller/conversation_controller.dart';

class ConversationView extends StatelessWidget {
  final ConversationController controller = Get.put(ConversationController());

  ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          const AppbarCircle(),

          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            final allCategories =
                controller.sections
                    .expand((section) => section.categories)
                    .toList();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(kBodyHp),
              child: Column(
                children: [
                  SizedBox(height: mobileHeight(context) * 0.4),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                        ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: allCategories.length,
                    itemBuilder: (context, index) {
                      final category = allCategories[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.conversationCategory,
                            arguments: category,
                          );
                        },
                        child: Container(
                          decoration: roundedDecorationWithShadow,
                          margin: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageActionButton(
                                backgroundColor: kWhite,
                                isCircular: true,
                                assetPath: 'assets/images/home-img/tenses.png',
                                size: primaryIcon(context),
                              ),
                              const SizedBox(height: kElementInnerGap),
                              Text(
                                category,
                                style: bodyBoldMediumStyle,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: kElementInnerGap),
                              Text('4/5', style: bodyMediumStyle),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
