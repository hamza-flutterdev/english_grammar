import 'package:english_grammer/core/widgets/text_widget.dart';
import 'package:english_grammer/presentation/tenses_screen/controller/tenses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/widgets/custom_appbar.dart';
import 'categoryNamesList.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TensesView extends StatelessWidget {
  const TensesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TensesController());

    final List<String> tabTitlesEN = [
      'Past Indefinite',
      'Past Continuous',
      'Past Perfect',
      'Past Perfect Continuous',
    ];

    final List<String> tabTitlesUR = [
      'ماضی غیر معینہ مدت',
      'ماضی کا مسلسل تناؤ',
      'ماضی کا مسلسل تناؤ',
      'ماضی کامل مسلسل تناؤ',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(subtitle: 'English Tenses'),
      body: Obx(
        () => Column(
          children: [
            Container(
              height: 56,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0XFF25abc7),
              ),
              child: Center(
                child: Text(
                  controller.psTCategory[controller.currentPage.value],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ClipRect(
              child: CarouselSlider.builder(
                carouselController: controller.carouselController,
                itemCount: controller.psTCategory.length,
                options: CarouselOptions(
                  height: 230,
                  enlargeCenterPage: true,
                  viewportFraction: 0.65,
                  onPageChanged: (index, reason) {
                    controller.currentPage.value = index;
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => TensesCategoriesScreen(
                          title: controller.psTCategory[index],
                        ),
                      );
                    },
                    child: Container(
                      width: 240,
                      height: 200,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              controller.psTCategory[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          regularText(
                            textTitle: tabTitlesUR[index],
                            textSize: 20,
                            textColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            AnimatedSmoothIndicator(
              activeIndex: controller.currentPage.value,
              count: controller.psTCategory.length,
              effect: WormEffect(
                activeDotColor: const Color(0XFF25abc7),
                dotColor: Colors.grey.shade300,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tabTitlesEN.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.carouselController.animateToPage(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color:
                            controller.currentPage.value == index
                                ? const Color(0XFF25abc7)
                                : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tabTitlesEN[index],
                        style: TextStyle(
                          color:
                              controller.currentPage.value == index
                                  ? Colors.white
                                  : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
