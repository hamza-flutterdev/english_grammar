import 'package:english_grammer/presentation/alphabet_screen/controller/alphabet_screen_control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/search_bar.dart';
import '../../../core/widgets/text_widget.dart';

class AlphabetScreenView extends StatefulWidget {
  const AlphabetScreenView({super.key});

  @override
  State<AlphabetScreenView> createState() => _AlphabetScreenViewState();
}

class _AlphabetScreenViewState extends State<AlphabetScreenView> {
  final AlphabetsController controller = Get.put(AlphabetsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: 'Alphabet Screen'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(kBodyHp),
            child: SearchBarField(
              controller: controller.searchController,
              onSearch: controller.performSearch,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.alphabetCateg.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              final filteredList =
                  controller.filteredAlphabetCateg.where((category) {
                    return category['category_name'] == 'vocabulary2';
                  }).toList();

              if (filteredList.isEmpty && controller.isSearching.value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      regularText(
                        textTitle: 'No results found',
                        textSize: 18,
                        textColor: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      regularText(
                        textTitle: 'Try searching with different keywords',
                        textSize: 14,
                        textColor: Colors.grey,
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final category = filteredList[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100.withValues(alpha: .7),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 14,
                        child: regularText(
                          textTitle:
                              (category['english_words'] as String)
                                      .trim()
                                      .isNotEmpty
                                  ? category['english_words'][0].toUpperCase()
                                  : '',
                          textSize: 16,
                          textColor: Colors.black,
                        ),
                      ),
                      title: regularText(
                        textTitle: category['english_words'] ?? '',
                        textSize: 18,
                        textColor: Colors.black,
                        textWeight: FontWeight.w600,
                      ),
                      subtitle: regularText(
                        textTitle: category['urdu_words'] ?? '',
                        textSize: 16,
                        textColor: Colors.blue,
                      ),
                      trailing: Icon(Icons.play_circle, color: Colors.blue),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
