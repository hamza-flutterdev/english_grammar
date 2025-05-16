import 'dart:async';
import 'package:english_grammer/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    _timer = Timer(Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.home); // Replaces the current screen
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
