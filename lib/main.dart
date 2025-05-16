import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'routes/route_pages.dart';

void main() {
  runApp(GrammerApp());
}

class GrammerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn English',
      initialRoute: AppRoutes.splash, // Set initial route here
      getPages: RoutePages.routes, // Use the defined routes
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
