import 'package:get/get.dart';
import '../presentation/home_screen/controller/home_screen_contrl.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}
