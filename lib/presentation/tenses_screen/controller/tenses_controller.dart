import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../data/database/db_helper.dart';

class TensesController extends GetxController {
  final DbHelper dbHelper = DbHelper();

  // Carousel state management
  final RxInt currentPage = 0.obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  @override
  void onInit() {
    super.onInit();
    fetchTensesData();
  }

  List<String> categoryTitle = [
    'Definition',
    'Affirmative Sentence',
    'Negative Sentence',
    'Interrogative Sentence',
  ];

  List<String> prTCategory = [
    'Present indefinite tense',
    'Present continuous tense',
    'Present perfect tense',
    'Present perfect continuous tense',
  ];

  List<String> psTCategory = [
    'Past indefinite tense',
    'Past continuous tense',
    'Past perfect tense',
    'Past perfect continuous tense',
  ];

  List<String> fuTCategory = [
    'Future indefinite tense',
    'Future continuous tense',
    'Future perfect tense',
    'Future perfect continuous tense',
  ];

  List<String> headingTitle = [
    'Present Tenses',
    'Future Tenses',
    'Past Tenses',
  ];

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
