import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../controller/vocabulary_tiles_controller.dart';

class VocabularyTiles extends StatelessWidget {
  const VocabularyTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final VocabularyTilesController controller = Get.put(
      VocabularyTilesController(),
    );
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    final String sectionTitle = arguments['sectionTitle'] ?? 'Categories';
    final List<String> categories = arguments['categories'] ?? [];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: sectionTitle),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(kBodyHp),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            bool allCategoriesLoaded = categories.every(
              (category) => controller.allCategories.containsKey(category),
            );

            if (!allCategoriesLoaded) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(kBodyHp),
              child: Column(
                children:
                    categories.map((category) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: kElementGap),
                        child: VocabularyTileCard(
                          category: category,
                          sectionTitle: sectionTitle,
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.vocabularyCategory,
                              arguments: category,
                            );
                          },
                        ),
                      );
                    }).toList(),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class VocabularyTileCard extends StatelessWidget {
  final String category;
  final String sectionTitle;
  final VoidCallback onTap;

  const VocabularyTileCard({
    super.key,
    required this.category,
    required this.sectionTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: mobileHeight(context) * 0.1,
        decoration: roundedDecorationWithShadow.copyWith(color: secondaryColor),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kElementInnerGap),
          child: Row(
            children: [
              ImageActionButton(
                size: secondaryIcon(context),
                backgroundColor: secondaryColor,
                color: primaryColor,
                isCircular: true,
                assetPath: 'assets/images/vocab-img/$sectionTitle.png',
              ),
              SizedBox(width: kBodyHp),
              Expanded(
                child: Text(
                  category,
                  style: titleSmallBoldStyle.copyWith(color: primaryColor),
                ),
              ),
              SizedBox(width: kBodyHp),
              Icon(
                Icons.arrow_forward_ios,
                color: primaryColor,
                size: secondaryIcon(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
