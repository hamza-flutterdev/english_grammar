import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../data/database/db_helper.dart';

class VocabularyCategoryController extends GetxController {
  final DbHelper dbHelper = DbHelper();
  var words = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  Future<void> loadWords(String categoryTitle) async {
    try {
      isLoading.value = true;

      await Future.delayed(const Duration(milliseconds: 200));

      await dbHelper.initDatabase();

      final data = await dbHelper.fetchBySubcategories([categoryTitle]);
      final filteredWords =
          data
              .where((item) => item['subCategory'] == categoryTitle)
              .cast<Map<String, dynamic>>()
              .toList();

      words.assignAll(filteredWords);
    } catch (e) {
      debugPrint("Error loading words: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
