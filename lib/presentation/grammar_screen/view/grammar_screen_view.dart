import 'package:english_grammer/presentation/grammar_screen/controller/grammar_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/text_widget.dart';

class GrammarView extends StatefulWidget {
  const GrammarView({super.key});

  @override
  State<GrammarView> createState() => _GrammarViewState();
}

class _GrammarViewState extends State<GrammarView> {
  final GrammerController controller = Get.put(GrammerController());
  final Set<String> expandedCategories = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(0, 60),
        child: CustomAppBar(subtitle: 'Grammar Screen'),
      ),
      body: Obx(() {
        if (controller.grammar.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // Grouping data by category_name
        final Map<String, List<Map<String, dynamic>>> groupedData = {};
        for (var item in controller.grammar) {
          final category = item['category_name'] ?? 'Unknown';
          groupedData.putIfAbsent(category, () => []).add(item);
        }

        return ListView(
          children:
              groupedData.entries.map((entry) {
                final categoryName = entry.key;
                final items = entry.value;
                final isExpanded = expandedCategories.contains(categoryName);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded
                              ? expandedCategories.remove(categoryName)
                              : expandedCategories.add(categoryName);
                        });
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0XFF25abc7),
                        ),
                        child: Center(
                          child: regularText(
                            textTitle: categoryName,
                            textSize: 24,
                            textColor: Colors.white,
                            textWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    if (isExpanded)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          final titleText = item['english_words'] ?? '';
                          final subtitleText = item['urdu_words'] ?? '';

                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 14,
                                child: regularText(
                                  textTitle: '${index + 1}',
                                  textSize: 16,
                                  textColor: Colors.black,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.play_circle,
                                color: Colors.blue,
                              ),
                              title: Text(
                                titleText,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                subtitleText,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                );
              }).toList(),
        );
      }),
    );
  }
}
