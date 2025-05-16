import 'package:english_grammer/core/widgets/text_widget.dart';
import 'package:english_grammer/presentation/home_screen/view/home_screen_view.dart';
import 'package:english_grammer/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
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
              onTap: (){
                Get.toNamed(AppRoutes.home);
              },
              child: Container(
                height: 50, width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple
                ),
                child: Center(child: regularText(textTitle: 'Get Started', textSize: 22, textColor: Colors.white, textWeight: FontWeight.w600)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
