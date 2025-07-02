import 'dart:async';
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
  final SharedPrefsService prefsService = SharedPrefsService();
  static const int totalProgressSteps = 100;

  Timer? _refreshTimer;
  final Map<String, int> _cachedSpeakCounts = {};
  final _refreshTrigger = 0.obs;

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
    _startPeriodicRefresh();
  }

  @override
  void onClose() {
    _refreshTimer?.cancel();
    super.onClose();
  }

  void _startPeriodicRefresh() {
    _refreshTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      loadData();
      loadAllCachedSpeakCounts();
    });
  }

  void stopPeriodicRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }

  void restartPeriodicRefresh() {
    stopPeriodicRefresh();
    _startPeriodicRefresh();
  }

  List<String> get allCategoryNames {
    return sections.expand((section) => section.categories).toList();
  }

  String getSpeakCountKey(String category) => 'speak_count_$category';

  int getSpeakCount(String category) {
    // Trigger refresh by accessing _refreshTrigger.value
    _refreshTrigger.value;
    return _cachedSpeakCounts[category] ?? 0;
  }

  Future<void> incrementSpeakCount(String category) async {
    await prefsService.incrementCounter(getSpeakCountKey(category));
    await loadAllCachedSpeakCounts();
  }

  int getProgressPercentage(String category) {
    final count = getSpeakCount(category);
    return ((count / totalProgressSteps) * 100).clamp(0, 100).toInt();
  }

  int getCurrentStep(String category) {
    return getSpeakCount(category).clamp(0, totalProgressSteps);
  }

  Future<void> resetSpeakCount(String category) async {
    await prefsService.resetCounter(getSpeakCountKey(category));
    await loadAllCachedSpeakCounts();
  }

  Future<void> resetAllSpeakCounts() async {
    final keys = allCategoryNames.map(getSpeakCountKey).toList();
    await prefsService.resetKeys(keys);
    await loadAllCachedSpeakCounts();
  }

  int getTotalSpeakCount() {
    final keys = allCategoryNames.map(getSpeakCountKey).toList();
    return prefsService.getTotalForKeys(keys);
  }

  // Load all cached speak counts from SharedPrefs
  Future<void> loadAllCachedSpeakCounts() async {
    try {
      if (allCategoryNames.isEmpty) {
        debugPrint('allCategoryNames is empty, skipping cache load');
        return;
      }
      for (final category in allCategoryNames) {
        final speakCount = prefsService.getValue<int>(
          getSpeakCountKey(category),
          0,
        );
        _cachedSpeakCounts[category] = speakCount;
      }
      // Trigger UI refresh
      _refreshTrigger.value++;
      debugPrint(
        'Cached speak counts loaded. Refresh trigger: ${_refreshTrigger.value}',
      );
    } catch (e) {
      debugPrint('Error loading cached speak counts: $e');
    }
  }

  // Method to be called by ConversationCategoryController
  Future<void> refreshSpeakCounts() async {
    await loadAllCachedSpeakCounts();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      await prefsService.init();
      final speakCountKeys = allCategoryNames.map(getSpeakCountKey).toList();
      await prefsService.loadKeys(speakCountKeys);
      await Future.delayed(const Duration(milliseconds: 200));
      await dbHelper.initDatabase();
      for (var section in sections) {
        for (String category in section.categories) {
          final data = await dbHelper.fetchBySubcategories([category]);
          allCategories[category] = data;
        }
      }
      // Load cached speak counts after data is loaded
      await loadAllCachedSpeakCounts();
      isLoading.value = false;
    } catch (e) {
      debugPrint("Error loading conversations: $e");
      isLoading.value = false;
    }
  }
}
