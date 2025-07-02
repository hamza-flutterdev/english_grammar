import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class VocabularyController extends GetxController {
  var isLoading = true.obs;

  Map<String, List<String>> get sectionCategories => {
    'People & Relationships': [
      'Family Members',
      'Occupations',
      'Employment',
      'Personality types',
    ],
    'Emotions & Mental State': ['Emotions', 'Ailments'],
    'Body & Health': ['Body parts', 'Health'],
    'Time & Grammar': ['Time adverb', 'Periods of time'],
    'Law & Society': ['Legal English', 'Warefare Weapons'],
    'Economics & Finance': ['Economics', 'Business & Banking'],
    'Food & Nutrition': ['Fruit', 'Vegetables', 'Food'],
  };

  final List<String> sections = [
    'People & Relationships',
    'Emotions & Mental State',
    'Body & Health',
    'Time & Grammar',
    'Law & Society',
    'Economics & Finance',
    'Food & Nutrition',
  ];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(milliseconds: 400));
      isLoading.value = false;
    } catch (e) {
      debugPrint("Error loading vocabulary sections: $e");
      isLoading.value = false;
    }
  }
}
