import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TensesController extends GetxController {
  final RxInt currentItem = 0.obs;
  final RxInt selectedTenseType = 0.obs;
  final RxInt bottomCarousel = 0.obs;

  final CarouselSliderController carouselController =
      CarouselSliderController();
  final CarouselSliderController bottomCarouselController =
      CarouselSliderController();

  List<String> headingTitle = [
    'Present Tenses',
    'Future Tenses',
    'Past Tenses',
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

  List<String> prTCategoryUrdu = [
    'حال سادہ زمانہ',
    'حال جاری زمانہ',
    'حال مکمل زمانہ',
    'حال مکمل جاری زمانہ',
  ];

  List<String> psTCategoryUrdu = [
    'ماضی سادہ زمانہ',
    'ماضی جاری زمانہ',
    'ماضی مکمل زمانہ',
    'ماضی مکمل جاری زمانہ',
  ];

  List<String> fuTCategoryUrdu = [
    'مستقبل سادہ زمانہ',
    'مستقبل جاری زمانہ',
    'مستقبل مکمل زمانہ',
    'مستقبل مکمل جاری زمانہ',
  ];

  List<String> tensesImages = [
    'assets/images/tense-img/indefinite.png',
    'assets/images/tense-img/continuous.png',
    'assets/images/tense-img/perfect.png',
    'assets/images/tense-img/perfect-continuous.png',
  ];

  List<String> iconImages = [
    'assets/images/tense-img/present.png',
    'assets/images/tense-img/past.png',
    'assets/images/tense-img/future.png',
  ];

  final List<Color> bottomCarouselIconColors = [
    kMintGreen,
    kBrightTeal,
    kLightCoral,
  ];

  final List<Color> bottomCarouselContainerColors = [
    kDarkGreenColor,
    kDeepSkyBlue,
    kDeepCoral,
  ];

  List<String> get currentCategory {
    switch (selectedTenseType.value) {
      case 0:
        return prTCategory;
      case 1:
        return fuTCategory;
      case 2:
      default:
        return psTCategory;
    }
  }

  List<String> get currentCategoryUrdu {
    switch (selectedTenseType.value) {
      case 0:
        return prTCategoryUrdu;
      case 1:
        return fuTCategoryUrdu;
      case 2:
      default:
        return psTCategoryUrdu;
    }
  }

  void onBottomCarouselChanged(int index) {
    bottomCarousel.value = index;
  }

  void onTenseTypeSelected(int index) {
    selectedTenseType.value = index;
    bottomCarousel.value = index;
    currentItem.value = 0;
    carouselController.animateToPage(0);
    bottomCarouselController.animateToPage(index);
  }
}

/*
create model for this like below just follow
this model
*/
class TenseGroup {
  final String heading;
  final List<String> categories;
  final List<String> categoriesUrdu;
  final String icon;
  final Color containerColor;
  final Color iconColor;

  TenseGroup({
    required this.heading,
    required this.categories,
    required this.categoriesUrdu,
    required this.icon,
    required this.containerColor,
    required this.iconColor,
  });
}
