import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../data/database/db_helper.dart';

class ConversationCategoryController extends GetxController {
  final DbHelper dbHelper = DbHelper();
  var conversations = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  Future<void> loadConversations(String categoryTitle) async {
    try {
      isLoading.value = true;
      await dbHelper.initDatabase();

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
}
