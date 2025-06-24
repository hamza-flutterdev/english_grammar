import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../data/database/db_helper.dart';

class ConversationController extends GetxController {
  final DbHelper dbHelper = DbHelper();
  var allCategories = <String, List<dynamic>>{}.obs;
  var isLoading = true.obs;

  final List<ConversationSection> sections = [
    ConversationSection(
      heading: 'People & Relationships',
      categories: [
        'Greetings',
        'How to Introduce Yourself',
        'Solving a Misunderstanding',
      ],
    ),
    ConversationSection(
      heading: 'Help & Accommodation',
      categories: ['Asking for Help and Directions', 'Accommodation'],
    ),
    ConversationSection(
      heading: 'Venues',
      categories: ['At Restaurant', 'At the bank', 'At Hospital', 'At Shop'],
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      await dbHelper.initDatabase();

      for (var section in sections) {
        for (String category in section.categories) {
          final data = await dbHelper.fetchBySubcategories([category]);
          allCategories[category] = data;
        }
      }

      isLoading.value = false;
    } catch (e) {
      debugPrint("Error loading conversations: $e");
      isLoading.value = false;
    }
  }
}

class ConversationSection {
  final String heading;
  final List<String> categories;

  ConversationSection({required this.heading, required this.categories});
}
