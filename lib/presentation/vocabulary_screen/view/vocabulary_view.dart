import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/section_header.dart';
import '../../../routes/app_routes.dart';
import '../controller/vocabulary_controller.dart';

class VocabularyView extends StatelessWidget {
  final VocabularyController controller = Get.put(VocabularyController());
  VocabularyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: 'English Vocabulary'),
      body: SingleChildScrollView(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(kBodyHp),
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(kBodyHp),
            child: Column(
              children: List.generate(
                controller.sections.length,
                (index) => VocabularySectionWidget(
                  controller: controller,
                  sectionIndex: index,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class VocabularySectionWidget extends StatelessWidget {
  final VocabularyController controller;
  final int sectionIndex;

  const VocabularySectionWidget({
    super.key,
    required this.controller,
    required this.sectionIndex,
  });

  @override
  Widget build(BuildContext context) {
    final section = controller.sections[sectionIndex];

    return Column(
      children: [
        SectionHeader(title: section.heading),
        SizedBox(height: kElementInnerGap),
        Obx(() {
          bool sectionLoaded = section.categories.every(
            (category) => controller.allCategories.containsKey(category),
          );

          if (!sectionLoaded) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            );
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.4,
              mainAxisSpacing: kElementGap,
              crossAxisSpacing: kElementWidthGap,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: section.categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.vocabularyCategory,
                    arguments: section.categories[index],
                  );
                },
                child: Container(
                  decoration: roundedPrimaryBorderDecoration,
                  child: Center(
                    child: Text(
                      section.categories[index],
                      style: bodyBoldMediumStyle.copyWith(color: kWhite),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}
