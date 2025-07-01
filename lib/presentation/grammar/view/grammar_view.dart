import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/section_header.dart';
import '../controller/grammar_controller.dart';

class GrammarView extends StatelessWidget {
  GrammarView({super.key});
  final GrammarController controller = Get.put(GrammarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomAppBar(subtitle: 'Grammar Screen'),
      body: Obx(() {
        if (controller.grammar.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(kBodyHp),
          child: ListView(
            children:
                controller.groupedData.entries.map((entry) {
                  final categoryName = entry.key;
                  final items = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.grammarCategories,
                            arguments: {
                              'categoryName': categoryName,
                              'items': items,
                            },
                          );
                        },
                        child: SectionHeader(title: categoryName),
                      ),
                    ],
                  );
                }).toList(),
          ),
        );
      }),
    );
  }
}
