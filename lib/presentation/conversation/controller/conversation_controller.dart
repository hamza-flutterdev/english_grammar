import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common_models/convo_model.dart';
import '../../../core/data/database/db_helper.dart';
import '../../../core/local_storage/shared_pref.dart';

class ConversationController extends GetxController {
  final DbHelper dbHelper = DbHelper();
  var allCategories = <String, dynamic>{}.obs;
  var isLoading = true.obs;
  var selectedCategory = 'Greetings'.obs;

  // Reference to SharedPrefsService
  final SharedPrefsService _prefsService = SharedPrefsService.instance;

  // Total steps for progress calculation
  static const int totalProgressSteps = 100;

  // Category data (moved from SharedPrefsService)
  final List<ConversationSection> sections = [
    ConversationSection(
      categories: [
        'Greetings',
        'How to Introduce Yourself',
        'Solving a Misunderstanding',
      ],
    ),
    ConversationSection(
      categories: ['Asking for Help and Directions', 'Accommodation'],
    ),
    ConversationSection(
      categories: ['At Restaurant', 'At the bank', 'At Hospital', 'At Shop'],
    ),
  ];

  final List<CategoryIcon> categoryIcons = [
    CategoryIcon(
      assetImage: 'assets/images/convo-img/greeting.png',
      color: kYellow,
    ),
    CategoryIcon(
      assetImage: 'assets/images/convo-img/introduction.png',
      color: kDeepSkyBlue,
    ),
    CategoryIcon(
      assetImage: 'assets/images/convo-img/misunderstanding.png',
      color: kBrightTeal,
    ),
    CategoryIcon(
      assetImage: 'assets/images/convo-img/help.png',
      color: kDarkGreenColor,
    ),
    CategoryIcon(
      assetImage: 'assets/images/convo-img/accommodation.png',
      color: kViolet,
    ),
    CategoryIcon(
      assetImage: 'assets/images/convo-img/restaurant.png',
      color: kDeepCoral,
    ),
    CategoryIcon(
      assetImage: 'assets/images/convo-img/bank.png',
      color: greyColor,
    ),
    CategoryIcon(
      assetImage: 'assets/images/convo-img/hospital.png',
      color: kRed,
    ),
    CategoryIcon(
      assetImage: 'assets/images/convo-img/shop.png',
      color: kChocoBrown,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  /// Get all category names as a flat list
  List<String> get allCategoryNames {
    return sections.expand((section) => section.categories).toList();
  }

  /// Generate unique key for speak count tracking
  String getSpeakCountKey(String category) {
    return 'speak_count_$category';
  }

  /// Get speak count for a specific category
  Future<int> getSpeakCount(String category) async {
    final key = getSpeakCountKey(category);
    return await _prefsService.getCounter(key);
  }

  /// Get speak count synchronously
  int getSpeakCountSync(String category) {
    final key = getSpeakCountKey(category);
    return _prefsService.getCounterSync(key);
  }

  /// Increment speak count for a category
  Future<void> incrementSpeakCount(String category) async {
    final key = getSpeakCountKey(category);
    await _prefsService.incrementCounter(key);
  }

  /// Get progress percentage for a specific category (0-100)
  int getProgressPercentage(String category) {
    final count = getSpeakCountSync(category);
    final percentage =
        ((count / totalProgressSteps) * 100).clamp(0, 100).toInt();
    return percentage;
  }

  /// Get current step for progress bar
  int getCurrentStep(String category) {
    final count = getSpeakCountSync(category);
    return count.clamp(0, totalProgressSteps);
  }

  /// Reset speak count for a specific category
  Future<void> resetSpeakCount(String category) async {
    final key = getSpeakCountKey(category);
    await _prefsService.resetCounter(key);
  }

  /// Reset all speak counts
  Future<void> resetAllSpeakCounts() async {
    final keys = allCategoryNames.map((cat) => getSpeakCountKey(cat)).toList();
    await _prefsService.resetCounters(keys);
  }

  /// Get total speak count across all categories
  Future<int> getTotalSpeakCount() async {
    final keys = allCategoryNames.map((cat) => getSpeakCountKey(cat)).toList();
    return await _prefsService.getTotalCount(keys);
  }

  Future loadData() async {
    try {
      isLoading.value = true;

      // Load all speak count keys
      final speakCountKeys =
          allCategoryNames.map((cat) => getSpeakCountKey(cat)).toList();
      await _prefsService.loadCounters(speakCountKeys);

      await Future.delayed(const Duration(milliseconds: 200));
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
