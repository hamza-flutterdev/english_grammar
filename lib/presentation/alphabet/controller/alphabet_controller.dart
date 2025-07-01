// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/database/db_helper.dart';

class AlphabetController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final DbHelper dbHelper = DbHelper();

  @override
  void onInit() {
    super.onInit();
    fetchAlphabetsData();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  var alphabetCategory = [].obs;
  var filteredAlphabetCategory = [].obs;
  var isSearching = false.obs;

  List<String> categoryTitle = List.generate(
    26,
    (index) => String.fromCharCode(65 + index),
  );

  Future<void> fetchAlphabetsData() async {
    try {
      await dbHelper.initDatabase();
      alphabetCategory.value = await dbHelper.fetchBySubcategories(
        categoryTitle,
      );
      filteredAlphabetCategory.value = alphabetCategory.value;
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void performSearch(String query) {
    isSearching.value = query.isNotEmpty;
    if (query.isEmpty) {
      filteredAlphabetCategory.value = alphabetCategory.value;
    } else {
      filteredAlphabetCategory.value =
          alphabetCategory.where((category) {
            final englishWord =
                (category['english_words'] ?? '').toString().toLowerCase();
            final urduWord =
                (category['urdu_words'] ?? '').toString().toLowerCase();
            final searchQuery = query.toLowerCase();

            return englishWord.contains(searchQuery) ||
                urduWord.contains(searchQuery);
          }).toList();
    }
  }

  void clearSearch() {
    searchController.clear();
    performSearch('');
  }
}
