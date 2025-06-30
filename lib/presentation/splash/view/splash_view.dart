import 'package:english_grammer/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 80,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.home);
              },
              child: Container(
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
                child: Center(
                  child: regularText(
                    textTitle: 'Get Started',
                    textSize: 22,
                    textColor: Colors.white,
                    textWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
