import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
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
      appBar: CustomAppBar(subtitle: 'Tenses'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(kBodyHp),
              itemCount: controller.tenseGroups.length,
              itemBuilder: (context, sectionIndex) {
                final tenseGroup = controller.tenseGroups[sectionIndex];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: kElementGap,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: primaryIcon(context),
                            height: primaryIcon(context),
                            padding: EdgeInsets.all(kElementInnerGap),
                            decoration: roundedDecoration.copyWith(
                              color: tenseGroup.iconColor.withValues(
                                alpha: 0.2,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                tenseGroup.icon,
                                color: tenseGroup.iconColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: kElementWidthGap),
                          Expanded(
                            child: Text(
                              tenseGroup.heading,
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: tenseGroup.containerColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ...List.generate(tenseGroup.categories.length, (index) {
                      final englishName = tenseGroup.categories[index];
                      final urduName = tenseGroup.categoriesUrdu[index];
                      final tenseType = controller.getTenseType(index);

                      return Card(
                        color: tenseGroup.containerColor,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: kContentPadding,
                          leading: Container(
                            width: primaryIcon(context),
                            height: primaryIcon(context),
                            padding: EdgeInsets.all(kElementInnerGap),
                            decoration: roundedDecoration.copyWith(
                              color: tenseGroup.iconColor.withValues(
                                alpha: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Image.asset(
                                tenseType.image,
                                color: kWhite,
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                englishName,
                                style: titleSmallBoldStyle.copyWith(
                                  color: kWhite,
                                ),
                              ),
                              const SizedBox(height: kElementInnerGap),
                              Text(
                                urduName,
                                textAlign: TextAlign.right,
                                style: urduBodyLargeStyle.copyWith(
                                  color: kWhite,
                                ),
                              ),
                            ],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: kWhite,
                            size: secondaryIcon(context),
                          ),
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.tensesCategories,
                              arguments: controller.currentCategory[index],
                            );
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: kBodyHp),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
