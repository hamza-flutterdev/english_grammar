import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../core/data/database/db_helper.dart';

class PhrasesController extends GetxController {
  final DbHelper dbHelper = DbHelper();

  @override
  void onInit() {
    super.onInit();
    fetchPhrasesData();
  }

  var categories = [].obs;

  List<String> categoryTitle = [
    'While Meeting And Leaving Someone',
    'Say Thanks',
    'Wish Someone Something',
    'How to request someone',
    'Art of saying No to the people',
    'Party or Feast',
    'Functional Word & Phrases',
  ];

  Future<void> fetchPhrasesData() async {
    try {
      await Future.delayed(Duration(milliseconds: 400));
      await dbHelper.initDatabase();
      categories.value = await dbHelper.fetchBySubcategories(categoryTitle);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
