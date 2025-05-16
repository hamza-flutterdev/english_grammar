import 'package:english_grammer/bindings/vocabulary_binding.dart';
import 'package:english_grammer/presentation/vocabulary_screen/view/vocabulary_view.dart';
import 'package:get/get.dart';
import '../bindings/homeScreen_binding.dart';
import '../bindings/splashScreen_binding.dart';
import '../presentation/home_screen/view/home_screen_view.dart';
import '../presentation/splash_screen/view/splash_screen_view.dart';

class RoutePages {
  static final routes = [
    GetPage(
      name: '/SplashScreen',
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/HomeScreen',
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: '/vocabulary',
    //   page: () => VocabularyView(),
    //   binding: VocabularyBinding(),
    // ),
  ];
}
