import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/database/db_helper.dart';

class VocabularyController extends GetxController{
  final DbHelper dbHelper = DbHelper();

  @override
  void onInit() {
    super.onInit();
    fetchFamilyMembersData(); // Call the new function
  }
  List<String> categoryTitle = [
    'Family Members',
    'Occupations',
    'Employment',
    'Personality types'
  ];
  List<String> categoryTitle2 = [
    'Emotions',
    'Ailments'
  ];
  List<String> categoryTitle3 = [
    'Body parts',
    'Health',
  ];
  List<String> categoryTitle4 = [
    'Time adverb',
    'Periods of time',
  ];
  List<String> categoryTitle5 = [
    'Legal English',
    'Warefare Weapons',
  ];
  List<String> categoryTitle6 = [
    'Economics',
    'Business & Banking',
  ];
  List<String> categoryTitle7 = [
    'Fruit',
    'Vegetables',
    'Food',
  ];

  List<String> headingTitle = [
    'People & Relationships',
    'Emotions & Mental State',
    'Body & Health',
    'Time & Grammar',
    'Law & Society',
    'Economics & Finance',
    'Food & Nutrition',
    'Home & Living',
    'Nature & Environment',
    'Colors & Shapes',
    'Clothing & Accessories',
    'Transportation & Tools',
    'Art & Entertainment',
  ];




  var categories1=[].obs;
  var categories2=[].obs;
  var categories3=[].obs;
  var categories4=[].obs;
  var categories5=[].obs;
  var categories6=[].obs;
  var categories7=[].obs;

  Future<void> fetchFamilyMembersData() async{ // Renamed the function
    try{
      await dbHelper.initDatabase();
      categories1.value = await dbHelper.fetchFamilyMembers(categoryTitle);
      categories2.value = await dbHelper.fetchFamilyMembers(categoryTitle2);
      categories3.value = await dbHelper.fetchFamilyMembers(categoryTitle3);
      categories4.value = await dbHelper.fetchFamilyMembers(categoryTitle4);
      categories5.value = await dbHelper.fetchFamilyMembers(categoryTitle5);
      categories6.value = await dbHelper.fetchFamilyMembers(categoryTitle6);
      categories7.value = await dbHelper.fetchFamilyMembers(categoryTitle7);
      // categories.value = await dbHelper.fetchEmotions(); // Use the new function
    }catch(e){
      print("Error: $e");
    }
  }
}
