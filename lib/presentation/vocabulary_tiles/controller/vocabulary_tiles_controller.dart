import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/data/database/db_helper.dart';

class VocabularyTilesController extends GetxController {
  final DbHelper dbHelper = DbHelper();
  var allCategories = <String, List<dynamic>>{}.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCategoriesData();
  }

  Future<void> loadCategoriesData() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(milliseconds: 400));
      await dbHelper.initDatabase();
      final Map<String, dynamic> arguments = Get.arguments ?? {};
      final List<String> categories = arguments['categories'] ?? [];

      for (String category in categories) {
        final data = await dbHelper.fetchBySubcategories([category]);
        allCategories[category] = data;
      }

      isLoading.value = false;
    } catch (e) {
      debugPrint("Error loading vocabulary categories: $e");
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    await loadCategoriesData();
  }
}
