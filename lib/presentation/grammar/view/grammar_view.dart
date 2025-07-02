import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common_models/grammar_model.dart';
import '../../../core/constants/constant.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../controller/grammar_controller.dart';

class GrammarView extends StatelessWidget {
  GrammarView({super.key});
  final GrammarController controller = Get.put(GrammarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomAppBar(subtitle: 'Parts of Speech'),
      body: Obx(() {
        if (controller.grammar.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<Widget> rows = [];
        final entries = controller.groupedData.entries.toList();
        for (int i = 0; i < entries.length; i += 2) {
          final rowItems = <CategoryItem>[];

          for (int j = i; j < i + 2 && j < entries.length; j++) {
            final entry = entries[j];
            final categoryName = entry.key;
            final items = entry.value;

            rowItems.add(
              CategoryItem(
                assetPath:
                    'assets/images/grammar-img/${categoryName.toLowerCase()}.png',
                text: categoryName,
                iconColor: primaryColor,
                backgroundColor: secondaryColor,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.grammarCategories,
                    arguments: {'categoryName': categoryName, 'items': items},
                  );
                },
              ),
            );
          }

          rows.add(CategoryRow(items: rowItems));

          if (i + 2 < entries.length) {
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

class CategoryRow extends StatelessWidget {
  final List<CategoryItem> items;
  const CategoryRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) => CategoryColumn(item: item)).toList(),
    );
  }
}

class CategoryColumn extends StatelessWidget {
  final CategoryItem item;
  const CategoryColumn({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageActionButton(
            width: mobileWidth(context) * 0.37,
            height: mobileWidth(context) * 0.37,
            borderRadius: BorderRadius.circular(24),
            assetPath: item.assetPath,
            size: largeIcon(context),
            color: item.iconColor,
            backgroundColor: item.backgroundColor,
            onTap: item.onTap,
          ),
          SizedBox(height: kElementInnerGap),
          Text(
            item.text,
            style: titleSmallBoldStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
