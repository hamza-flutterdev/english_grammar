import 'package:get/get.dart';
import '../presentation/vocabulary_screen/controller/vocabulary_controller.dart';
import '../routes/app_routes.dart';

class VocabularyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => VocabularyController());
    Get.toNamed(AppRoutes.vocabulary);
  }
}
