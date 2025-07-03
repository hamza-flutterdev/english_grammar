import 'package:device_preview/device_preview.dart';
import 'package:english_grammer/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/route_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    DevicePreview(
      enabled: false, // Set to false before production release
      builder: (context) => GrammarApp(),
    ),
  );
}

class GrammarApp extends StatelessWidget {
  const GrammarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Learn English',
      initialRoute: AppRoutes.splash,
      getPages: RoutePages.routes,
      theme: ThemeData(fontFamily: fontPrimary),
    );
  }
}
