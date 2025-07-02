import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../tenses/controller/tenses_controller.dart';

class TensesListView extends StatelessWidget {
  const TensesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TensesController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: 'Tenses'),
      body: Builder(
        builder: (context) {
          final List<Widget> sections = [];

          for (
            int groupIndex = 0;
            groupIndex < controller.tenseGroups.length;
            groupIndex++
          ) {
            final tenseGroup = controller.tenseGroups[groupIndex];
            sections.add(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kElementGap),
                child: Row(
                  children: [
                    Container(
                      width: primaryIcon(context),
                      height: primaryIcon(context),
                      padding: EdgeInsets.all(kElementInnerGap),
                      decoration: roundedDecoration.copyWith(
                        color: tenseGroup.iconColor.withValues(alpha: 0.2),
                      ),
                      child: Center(
                        child: Image.asset(
                          tenseGroup.icon,
                          color: tenseGroup.containerColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: kElementWidthGap),
                    Expanded(
                      child: Text(
                        tenseGroup.heading,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
            final List<Widget> rows = [];
            for (int i = 0; i < tenseGroup.categories.length; i += 2) {
              final rowItems = <TenseItem>[];

              for (
                int j = i;
                j < i + 2 && j < tenseGroup.categories.length;
                j++
              ) {
                final englishName = tenseGroup.categories[j];
                final urduName = tenseGroup.categoriesUrdu[j];
                final tenseType = controller.getTenseType(j);

                rowItems.add(
                  TenseItem(
                    assetPath: tenseType.image,
                    englishText: englishName,
                    urduText: urduName,
                    iconColor: tenseGroup.iconColor,
                    backgroundColor: tenseGroup.iconColor,
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.tensesCategories,
                        arguments: controller.currentCategory[j],
                      );
                    },
                  ),
                );
              }

              rows.add(TenseRow(items: rowItems));
              if (i + 2 < tenseGroup.categories.length) {
                rows.add(SizedBox(height: kElementGap));
              }
            }

            sections.addAll(rows);

            // Add spacing between groups
            if (groupIndex < controller.tenseGroups.length - 1) {
              sections.add(SizedBox(height: kBodyHp));
            }
          }

          return Padding(
            padding: const EdgeInsets.all(kBodyHp),
            child: SingleChildScrollView(child: Column(children: sections)),
          );
        },
      ),
    );
  }
}

class TenseRow extends StatelessWidget {
  final List<TenseItem> items;

  const TenseRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) => TenseColumn(item: item)).toList(),
    );
  }
}

class TenseColumn extends StatelessWidget {
  final TenseItem item;

  const TenseColumn({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        width: mobileWidth(context) * 0.42,
        height: mobileWidth(context) * 0.42,
        padding: const EdgeInsets.all(kElementInnerGap),
        decoration: roundedDecoration.copyWith(color: item.backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ImageActionButton(
            //   width: mobileWidth(context) * 0.37,
            //   height: mobileWidth(context) * 0.37,
            //   padding: EdgeInsets.all(kElementInnerGap),
            //   backgroundColor: item.iconColor.withValues(alpha: 0.2),
            //   borderRadius: BorderRadius.circular(25),
            //   assetPath: item.assetPath,
            // ),
            //
            // SizedBox(height: kElementInnerGap),
            Text(
              item.englishText,
              style: titleSmallBoldStyle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: kBodyHp),
            Text(
              item.urduText,
              style: urduBodyLargeStyle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class TenseItem {
  final String assetPath;
  final String englishText;
  final String urduText;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const TenseItem({
    required this.assetPath,
    required this.englishText,
    required this.urduText,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });
}
