import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../data/database/db_helper.dart';

class VocabularyController extends GetxController {
  final DbHelper dbHelper = DbHelper();
  var allCategories = <String, List<dynamic>>{}.obs;
  var isLoading = true.obs;

  final List<VocabularySection> sections = [
    VocabularySection(
      heading: 'People & Relationships',
      categories: [
        'Family Members',
        'Occupations',
        'Employment',
        'Personality types',
      ],
    ),
    VocabularySection(
      heading: 'Emotions & Mental State',
      categories: ['Emotions', 'Ailments'],
    ),
    VocabularySection(
      heading: 'Body & Health',
      categories: ['Body parts', 'Health'],
    ),
    VocabularySection(
      heading: 'Time & Grammar',
      categories: ['Time adverb', 'Periods of time'],
    ),
    VocabularySection(
      heading: 'Law & Society',
      categories: ['Legal English', 'Warefare Weapons'],
    ),
    VocabularySection(
      heading: 'Economics & Finance',
      categories: ['Economics', 'Business & Banking'],
    ),
    VocabularySection(
      heading: 'Food & Nutrition',
      categories: ['Fruit', 'Vegetables', 'Food'],
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
      debugPrint("Error loading vocabulary: $e");
      isLoading.value = false;
    }
  }
}

class VocabularySection {
  final String heading;
  final List<String> categories;

  VocabularySection({required this.heading, required this.categories});
}
