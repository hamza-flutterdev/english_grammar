import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/carousel_bottom_icon.dart';
import '../../../core/widgets/carousel_top_icon.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../controller/tenses_controller.dart';

class TensesView extends StatelessWidget {
  const TensesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TensesController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(subtitle: 'English Tenses'),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(kBodyHp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tenses',
                      style: titleBoldMediumStyle.copyWith(
                        color: textGreyColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.tensesList),
                      child: Text(
                        'Show All',
                        style: titleBoldMediumStyle.copyWith(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kElementGap),
              CarouselTopIcon(
                items: controller.headingTitle,
                carouselController: controller.bottomCarouselController,
                imgPath: controller.iconImages,
                onIndexChanged:
                    (index) => controller.onBottomCarouselChanged(index),
                onItemTap: (index) => controller.onTenseTypeSelected(index),
                currentIndex: controller.bottomCarousel.value,
                selectedIndex: controller.selectedTenseType.value,
                autoPlay: false,
                viewportFraction: 0.5,
                enlargeCenterPage: true,
                height: mobileHeight(context) * 0.2,
                itemMargin: kHorizontalMargin,
                enableInfiniteScroll: true,
                smallerIcons: true,
                containerColors: controller.bottomCarouselContainerColors,
                iconColors: controller.bottomCarouselIconColors,
                titleTextStyle: titleSmallBoldStyle.copyWith(color: kWhite),
              ),
              const SizedBox(height: kElementGap),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kBodyHp),
                child: SectionHeader(
                  title:
                      controller.currentCategory[controller.currentItem.value],
                ),
              ),
              const SizedBox(height: kElementGap),
              CarouselBottomIcon(
                items: controller.currentCategory,
                urduTitles: controller.currentCategoryUrdu,
                imgPath: controller.tensesImages,
                carouselController: controller.carouselController,
                onIndexChanged: (index) => controller.currentItem.value = index,
                onItemTap: (index) {
                  Get.toNamed(
                    AppRoutes.tensesCategories,
                    arguments: controller.currentCategory[index],
                  );
                },
                currentIndex: controller.currentItem.value,
                autoPlay: true,
                viewportFraction: 0.65,
                titleTextStyle: titleSmallBoldStyle.copyWith(color: kWhite),
                urduTextStyle: titleSmallBoldStyle.copyWith(color: kWhite),
              ),
              const SizedBox(height: kElementGap),
              AnimatedSmoothIndicator(
                activeIndex: controller.currentItem.value,
                count: controller.currentCategory.length,
                effect: WormEffect(
                  activeDotColor: primaryColor,
                  dotColor: greyColor.withValues(alpha: 0.7),
                  dotHeight: mobileWidth(context) * 0.025,
                  dotWidth: mobileWidth(context) * 0.025,
                ),
              ),
              const SizedBox(height: kBodyHp),
            ],
          ),
        ),
      ),
    );
  }
}
