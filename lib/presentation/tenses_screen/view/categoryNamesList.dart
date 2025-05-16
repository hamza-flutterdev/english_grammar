import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/text_widget.dart';
import '../controller/tenses_controller.dart';

class TensesCategoriesScreen extends StatefulWidget {
  final String title;
  const TensesCategoriesScreen({super.key, required this.title});

  @override
  State<TensesCategoriesScreen> createState() => _TensesCategoriesScreenState();
}

class _TensesCategoriesScreenState extends State<TensesCategoriesScreen> {
  final TensesController controller = Get.put(TensesController());

  final Map<int, String> indexLabels = {
    1: 'Affirmative Sentence',
    5: 'Negative Sentence',
    9: 'Interrogative Sentence',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 60),
        child: CustomAppBar(
          title: widget.title,
          textColor: Colors.white,
          textSize: 24,
          textWeight: FontWeight.w400,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (controller.tensesCat.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                final filteredList = controller.tensesCat.where((category) {
                  return category['category_name'] == widget.title;
                }).toList();

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final List<Widget> widgets = [];

                    final category = filteredList[index];
                    final englishText = category['english_words']?.toLowerCase() ?? '';

                    // Always show 'Definition' at index 0
                    if (index == 0) {
                      widgets.add(
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.shade100,
                          ),
                          child: Center(
                            child: regularText(
                              textTitle: 'Definition',
                              textSize: 16,
                              textColor: Colors.black,
                              textWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }

                    // Show labeled container if "subject" is found
                    if (englishText.contains('subject')) {
                      widgets.add(
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade100,
                          ),
                          child: Center(
                            child: regularText(
                              textTitle: indexLabels[index] ?? 'Negative Sentences' ,
                              textSize: 16,
                              textColor: Colors.black,
                              textWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }

                    // Main content blocks
                    widgets.addAll([
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          color: Colors.grey.shade100,
                        ),
                        child: ListTile(
                          // leading: Text('$index'),
                          title: regularText(
                            textTitle: category['english_words'] ?? '',
                            textSize: 18,
                            textColor: Colors.black,
                            textWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          color: Colors.grey.shade100,
                        ),
                        child: ListTile(
                          subtitle: regularText(
                            textAlign: TextAlign.center,
                            textTitle: category['urdu_words'] ?? '',
                            textSize: 18,
                            textColor: Colors.blue,
                          ),
                        ),
                      ),
                    ]);

                    return Column(children: widgets);
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
