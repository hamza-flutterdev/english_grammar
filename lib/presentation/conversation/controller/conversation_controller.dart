import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/database/db_helper.dart';

class ConversationController extends GetxController {
  final DbHelper dbHelper = DbHelper();
  var allCategories = <String, dynamic>{}.obs;
  var isLoading = true.obs;

  var selectedCategory = 'Greetings'.obs;

  final List<ConversationSection> sections = [
    ConversationSection(
      //heading: 'People & Relationships',
      categories: [
        'Greetings',
        'How to Introduce Yourself',
        'Solving a Misunderstanding',
      ],
    ),
    ConversationSection(
      // heading: 'Help & Accommodation',
      categories: ['Asking for Help and Directions', 'Accommodation'],
    ),
    ConversationSection(
      // heading: 'Venues',
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

  Future loadData() async {
    try {
      isLoading.value = true;
      Future.delayed(const Duration(milliseconds: 200));
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

class ConversationSection {
  //final String heading;
  final List<String> categories;

  ConversationSection({required this.categories});
}

class CategoryIcon {
  final String assetImage;
  final Color color;

  CategoryIcon({required this.assetImage, required this.color});
}
