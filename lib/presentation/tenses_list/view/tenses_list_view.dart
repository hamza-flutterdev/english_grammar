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

    final sectionTitles = controller.headingTitle;
    final categories = [
      controller.prTCategory,
      controller.fuTCategory,
      controller.psTCategory,
    ];
    final urduTitles = [
      controller.prTCategoryUrdu,
      controller.fuTCategoryUrdu,
      controller.psTCategoryUrdu,
    ];

    return Scaffold(
      appBar: CustomAppBar(subtitle: 'Tenses'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(kBodyHp),
              itemCount: sectionTitles.length,
              itemBuilder: (context, sectionIndex) {
                final title = sectionTitles[sectionIndex];
                final subItems = categories[sectionIndex];
                final subItemsUrdu = urduTitles[sectionIndex];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: kElementGap,
                      ),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ),

                    ...List.generate(subItems.length, (index) {
                      final english = subItems[index];
                      final urdu = subItemsUrdu[index];

                      return Card(
                        color: primaryColor,
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                english,
                                style: titleSmallBoldStyle.copyWith(
                                  color: kWhite,
                                ),
                              ),
                              SizedBox(height: kElementInnerGap),
                              Text(
                                urdu,
                                textAlign: TextAlign.right,
                                style: titleSmallBoldStyle.copyWith(
                                  color: kWhite,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.tensesCategories,
                              arguments: english,
                            );
                          },
                        ),
                      );
                    }),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: kBodyHp),
        ],
      ),
    );
  }
}
