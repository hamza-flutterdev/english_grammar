import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/data/database/db_helper.dart';
import '../../../core/local_storage/shared_pref.dart';

class ConversationCategoryController extends GetxController {
  final DbHelper dbHelper = DbHelper();
  var conversations = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  // Add reference to SharedPrefsService
  final SharedPrefsService _prefsService = SharedPrefsService.instance;

  // Track current category for speak button updates
  String? currentCategory;

  /// Generate unique key for speak count tracking
  String getSpeakCountKey(String category) {
    return 'speak_count_$category';
  }

  Future<void> loadConversations(String categoryTitle) async {
    try {
      isLoading.value = true;
      currentCategory = categoryTitle; // Store current category

      // Load the speak count for this specific category
      final speakCountKey = getSpeakCountKey(categoryTitle);
      await _prefsService.loadCounter(speakCountKey);

      await dbHelper.initDatabase();
      await Future.delayed(const Duration(milliseconds: 200));
      final data = await dbHelper.fetchBySubcategories([categoryTitle]);
      final filteredConversations =
          data
              .where((item) => item['subCategory'] == categoryTitle)
              .cast<Map<String, dynamic>>()
              .toList();
      conversations.assignAll(filteredConversations);
      isLoading.value = false;
    } catch (e) {
      debugPrint("Error loading conversations: $e");
      isLoading.value = false;
    }
  }

  // Method to handle speak button press
  Future<void> onSpeakButtonPressed() async {
    if (currentCategory != null) {
      final key = getSpeakCountKey(currentCategory!);
      await _prefsService.incrementCounter(key);
    }
  }

  /// Get current speak count for the loaded category
  int getCurrentSpeakCount() {
    if (currentCategory != null) {
      final key = getSpeakCountKey(currentCategory!);
      return _prefsService.getCounterSync(key);
    }
    return 0;
  }

  /// Reset speak count for current category
  Future<void> resetCurrentSpeakCount() async {
    if (currentCategory != null) {
      final key = getSpeakCountKey(currentCategory!);
      await _prefsService.resetCounter(key);
    }
  }
}
