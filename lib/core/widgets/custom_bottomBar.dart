// import 'package:flutter/material.dart';
//
// import '../../presentation/home_screen/controller/home_screen_contrl.dart';
// import '../../utils/appIcon.dart';
//
//
// class CustomBottomBar extends StatelessWidget {
//   const CustomBottomBar({
//     super.key,
//     required this.controller,
//   });
//
//   final HomeScreenController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.white,
//       currentIndex: controller.currentIndex.value,
//       onTap: controller.changeIndex,
//       items: [
//         BottomNavigationBarItem(
//             icon: Image.asset(AppIcon.vocabularyIcon, scale: 12),
//             label: 'Vocabulary'),
//         BottomNavigationBarItem(
//             icon: Image.asset(AppIcon.phraseIcon, scale: 12),
//             label: 'Phrases'),
//         BottomNavigationBarItem(
//             icon: Image.asset(AppIcon.tensesIcon, scale: 12),
//             label: 'Tenses'),
//       ],
//     );
//   }
// }