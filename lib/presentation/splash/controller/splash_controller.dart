import 'dart:async';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';

class SplashController extends GetxController {
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
