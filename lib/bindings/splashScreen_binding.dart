import 'package:get/get.dart';

import '../presentation/splash_screen/controller/splash_screen_contrl.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
