import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/database/db_helper.dart';

class TensesCategoriesController extends GetxController {
  final DbHelper dbHelper = DbHelper();

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(milliseconds: 400), () => fetchTensesData());
  }

  List<String> categoryTitle = [
    'Definition',
    'Affirmative Sentence',
    'Negative Sentence',
    'Interrogative Sentence',
  ];

  final Map<int, String> indexLabels = const {
    1: 'Affirmative Sentence',
    5: 'Negative Sentence',
    9: 'Interrogative Sentence',
  };

  var tensesCat = [].obs;

  Future<void> fetchTensesData() async {
    try {
      await dbHelper.initDatabase();
      tensesCat.value = await dbHelper.fetchBySubcategories(categoryTitle);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
