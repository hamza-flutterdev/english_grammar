import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash-img/splash_bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Obx(
          () => SafeArea(
            child: Padding(
              padding: EdgeInsets.all(kBodyHp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: kBodyHp * 1.5),
                      RichText(
                        text: TextSpan(
                          children: List.generate('Learn English'.length, (
                            index,
                          ) {
                            final isVisible =
                                index < controller.visibleLetters.value;
                            return TextSpan(
                              text: 'Learn English'[index],
                              style: headlineLargeStyle.copyWith(
                                color: isVisible ? kWhite : transparent,
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: kElementInnerGap),
                      AnimatedDefaultTextStyle(
                        style: headlineSmallStyle.copyWith(
                          color: controller.urduTextColor.value,
                          fontFamily: fontSecondary,
                        ),
                        duration: const Duration(milliseconds: 1500),
                        child: Text('Speaking in Urdu'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: mobileHeight(context) * 0.1,
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child:
                          controller.showButton.value
                              ? AnimatedOpacity(
                                opacity:
                                    controller.showButton.value ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 800),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: kBodyHp,
                                  ),
                                  child: CustomButton(
                                    width: mobileWidth(context) * 0.6,
                                    backgroundColor: kWhite,
                                    textColor: primaryColor,
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.home);
                                    },
                                    text: "Let's Go",
                                  ),
                                ),
                              )
                              : LoadingAnimationWidget.stretchedDots(
                                color: kWhite,
                                size: mobileWidth(context) * 0.2,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
