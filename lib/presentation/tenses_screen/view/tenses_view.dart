import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/section_header.dart';
import 'package:english_grammer/presentation/tenses_screen/controller/tenses_controller.dart';
import 'package:english_grammer/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/enums/enums.dart';
import '../../../core/widgets/carousel_widget.dart';
import '../../../core/widgets/custom_appbar.dart';

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
                child: SectionHeader(
                  title:
                      controller.currentCategory[controller.currentItem.value],
                ),
              ),

              CarouselWidget(
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
                iconPosition: IconPosition.bottom,
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
              const SizedBox(height: kElementGap),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kBodyHp),
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
                          color: textGreyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kElementGap),
              CarouselWidget(
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
                iconPosition: IconPosition.top,
                titleTextStyle: titleSmallBoldStyle.copyWith(color: kWhite),
              ),
              const SizedBox(height: kBodyHp),
            ],
          ),
        ),
      ),
    );
  }
}
