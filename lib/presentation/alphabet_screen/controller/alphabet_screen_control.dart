import 'package:english_grammer/data/database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlphabetsController extends GetxController {
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

  var alphabetCateg = [].obs;
  var filteredAlphabetCateg = [].obs;
  var isSearching = false.obs;

  List<String> categoryTitle = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  Future<void> fetchAlphabetsData() async {
    try {
      await dbHelper.initDatabase();
      alphabetCateg.value = await dbHelper.fetchFamilyMembers(categoryTitle);
      // Initialize filtered list with all data
      filteredAlphabetCateg.value = alphabetCateg.value;
    } catch (e) {
      print('Error: $e');
    }
  }

  void performSearch(String query) {
    isSearching.value = query.isNotEmpty;

    if (query.isEmpty) {
      // If search is empty, show all data
      filteredAlphabetCateg.value = alphabetCateg.value;
    } else {
      // Filter data based on search query
      filteredAlphabetCateg.value =
          alphabetCateg.where((category) {
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
