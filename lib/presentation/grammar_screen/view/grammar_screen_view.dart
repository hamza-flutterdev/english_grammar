import 'package:english_grammer/presentation/grammar_screen/controller/grammar_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/text_widget.dart';

class GrammarView extends StatefulWidget {
  const GrammarView({super.key});

  @override
  State<GrammarView> createState() => _GrammarViewState();
}
class _GrammarViewState extends State<GrammarView> {
  final GrammerController controller = Get.put(GrammerController());

  // Map to track expanded items
  final Set<int> expandedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(0, 60),
        child: CustomAppBar(
          title: 'Grammar Screen',
          textColor: Colors.white,
          textSize: 24,
          textWeight: FontWeight.w400,
        ),
      ),
      body: Obx(() {
        if (controller.grammar.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final Map<String, List<Map<String, dynamic>>> groupedData = {};

          for (var item in controller.grammar) {
            final category = item['category_name'] ?? 'Unknown';
            if (!groupedData.containsKey(category)) {
              groupedData[category] = [];
            }
            groupedData[category]!.add(item);
          }

          return ListView(
            children: groupedData.entries.map((entry) {
              final categoryName = entry.key;
              final items = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final category = items[index];
                      final titleText = category['english_words'] ?? '';
                      final subtitleText = category['urdu_words'] ?? '';
                      final isExpanded = expandedItems.contains(index);
                      final isTitleText = titleText.toString().length > 30;
                      final isSubtitleText = subtitleText.toString().length > 30;

                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isExpanded) {
                                  expandedItems.remove(index);
                                } else {
                                  expandedItems.add(index);
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100.withValues(alpha: .7),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade200)
                              ),
                              child: ListTile(
                                leading: titleText.toString().length > 30
                                    ? null
                                    : CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 14,
                                  child: regularText(
                                    textTitle: '${index + 1}',
                                    textSize: 16,
                                    textColor: Colors.black,
                                  ),
                                ),
                                trailing: titleText.toString().length > 30
                                          ? null
                                          : Icon(Icons.play_circle, color: Colors.blue,),
                                title: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        titleText,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        maxLines: isExpanded ? null : 1,
                                        overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                                      ),
                                    ),

                                  ],
                                ),

                                subtitle: Row(
                                children: [
                                Expanded(
                      child: Text(
                        subtitleText,
                      style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      ),
                      maxLines: isExpanded ? null : 1,
                      overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                      ),
                      ),

                      ],
                      ),
                                ),
                              ),
                            ),

                        ],
                      );
                    },
                  ),
                ],
              );
            }).toList(),
          );
        }
      }),
    );
  }
}


