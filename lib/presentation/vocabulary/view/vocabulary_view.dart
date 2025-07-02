import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../controller/vocabulary_controller.dart';

class VocabularyView extends StatelessWidget {
  final VocabularyController controller = Get.put(VocabularyController());
  VocabularyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: 'English Vocabulary'),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(kBodyHp),
              child: CircularProgressIndicator(),
            ),
          );
        }

        final List<Widget> rows = [];
        final sections = controller.sections;

        for (int i = 0; i < sections.length; i += 2) {
          final rowItems = <VocabularyItem>[];
          for (int j = i; j < i + 2 && j < sections.length; j++) {
            final sectionTitle = sections[j];
            final categories = controller.sectionCategories[sectionTitle] ?? [];

            rowItems.add(
              VocabularyItem(
                assetPath: 'assets/images/vocab-img/$sectionTitle.png',
                text: sectionTitle,
                iconColor: primaryColor,
                backgroundColor: secondaryColor,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.vocabularyTiles,
                    arguments: {
                      'sectionTitle': sectionTitle,
                      'categories': categories,
                    },
                  );
                },
              ),
            );
          }
          rows.add(VocabularyRow(items: rowItems));
          if (i + 2 < sections.length) {
            rows.add(SizedBox(height: kElementGap));
          }
        }

        return Padding(
          padding: const EdgeInsets.all(kBodyHp),
          child: SingleChildScrollView(child: Column(children: rows)),
        );
      }),
    );
  }
}

class VocabularyRow extends StatelessWidget {
  final List<VocabularyItem> items;
  const VocabularyRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) => VocabularyColumn(item: item)).toList(),
    );
  }
}

class VocabularyColumn extends StatelessWidget {
  final VocabularyItem item;
  const VocabularyColumn({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageActionButton(
            width: mobileWidth(context) * 0.36,
            height: mobileWidth(context) * 0.36,
            borderRadius: BorderRadius.circular(24),
            assetPath: item.assetPath,
            size: largeIcon(context),
            color: item.iconColor,
            backgroundColor: item.backgroundColor,
            onTap: item.onTap,
          ),
          SizedBox(height: kElementInnerGap),
          SizedBox(
            width: mobileWidth(context) * 0.36,
            child: Text(
              item.text,
              style: titleSmallBoldStyle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class VocabularyItem {
  final String assetPath;
  final String text;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const VocabularyItem({
    required this.assetPath,
    required this.text,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });
}
