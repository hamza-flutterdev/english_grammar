import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../core/common_models/tenses_model.dart';

class TensesController extends GetxController {
  final RxInt currentItem = 0.obs;
  final RxInt selectedTenseType = 0.obs;
  final RxInt bottomCarousel = 0.obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final CarouselSliderController bottomCarouselController =
      CarouselSliderController();

  final List<TenseType> tenseTypes = [
    TenseType(
      name: 'Present indefinite tense',
      nameUrdu: 'حال سادہ زمانہ',
      image: 'assets/images/tense-img/indefinite.png',
    ),
    TenseType(
      name: 'Present continuous tense',
      nameUrdu: 'حال جاری زمانہ',
      image: 'assets/images/tense-img/continuous.png',
    ),
    TenseType(
      name: 'Present perfect tense',
      nameUrdu: 'حال مکمل زمانہ',
      image: 'assets/images/tense-img/perfect.png',
    ),
    TenseType(
      name: 'Present perfect continuous tense',
      nameUrdu: 'حال مکمل جاری زمانہ',
      image: 'assets/images/tense-img/perfect-continuous.png',
    ),
  ];

  final List<TenseGroup> tenseGroups = [
    TenseGroup(
      heading: 'Present Tenses',
      categories: [
        'Present indefinite tense',
        'Present continuous tense',
        'Present perfect tense',
        'Present perfect continuous tense',
      ],
      categoriesUrdu: [
        'حال سادہ زمانہ',
        'حال جاری زمانہ',
        'حال مکمل زمانہ',
        'حال مکمل جاری زمانہ',
      ],
      icon: 'assets/images/tense-img/present.png',
      containerColor: kDarkGreenColor,
      iconColor: kMintGreen,
    ),
    TenseGroup(
      heading: 'Future Tenses',
      categories: [
        'Future indefinite tense',
        'Future continuous tense',
        'Future perfect tense',
        'Future perfect continuous tense',
      ],
      categoriesUrdu: [
        'مستقبل سادہ زمانہ',
        'مستقبل جاری زمانہ',
        'مستقبل مکمل زمانہ',
        'مستقبل مکمل جاری زمانہ',
      ],
      icon: 'assets/images/tense-img/future.png',
      containerColor: kDeepSkyBlue,
      iconColor: kBrightTeal,
    ),
    TenseGroup(
      heading: 'Past Tenses',
      categories: [
        'Past indefinite tense',
        'Past continuous tense',
        'Past perfect tense',
        'Past perfect continuous tense',
      ],
      categoriesUrdu: [
        'ماضی سادہ زمانہ',
        'ماضی جاری زمانہ',
        'ماضی مکمل زمانہ',
        'ماضی مکمل جاری زمانہ',
      ],
      icon: 'assets/images/tense-img/past.png',
      containerColor: kDeepCoral,
      iconColor: kCoral,
    ),
  ];

  List<String> get headingTitle =>
      tenseGroups.map((group) => group.heading).toList();

  List<String> get tensesImages =>
      tenseTypes.map((type) => type.image).toList();

  List<String> get iconImages =>
      tenseGroups.map((group) => group.icon).toList();

  List<Color> get bottomCarouselIconColors =>
      tenseGroups.map((group) => group.iconColor).toList();

  List<Color> get bottomCarouselContainerColors =>
      tenseGroups.map((group) => group.containerColor).toList();

  List<String> get currentCategory {
    if (selectedTenseType.value < tenseGroups.length) {
      return tenseGroups[selectedTenseType.value].categories;
    }
    return tenseGroups[0].categories;
  }

  List<String> get currentCategoryUrdu {
    if (selectedTenseType.value < tenseGroups.length) {
      return tenseGroups[selectedTenseType.value].categoriesUrdu;
    }
    return tenseGroups[0].categoriesUrdu;
  }

  TenseGroup get currentTenseGroup {
    if (selectedTenseType.value < tenseGroups.length) {
      return tenseGroups[selectedTenseType.value];
    }
    return tenseGroups[0];
  }

  TenseGroup getTenseGroup(int index) {
    if (index < tenseGroups.length) {
      return tenseGroups[index];
    }
    return tenseGroups[0];
  }

  TenseType getTenseType(int index) {
    if (index < tenseTypes.length) {
      return tenseTypes[index];
    }
    return tenseTypes[0];
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
