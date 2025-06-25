import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../routes/app_routes.dart';
import '../../tenses_screen/controller/tenses_controller.dart';

class TensesListScreen extends StatelessWidget {
  const TensesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TensesController());

    final items = controller.currentCategory;
    return Scaffold(
      appBar: CustomAppBar(subtitle: 'Tenses'),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              Get.toNamed(AppRoutes.tensesCategories, arguments: items[index]);
            },
          );
        },
      ),
    );
  }
}
