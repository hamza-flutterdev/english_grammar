import 'dart:ui';

class TenseGroup {
  final String heading;
  final List<String> categories;
  final List<String> categoriesUrdu;
  final String icon;
  final Color containerColor;
  final Color iconColor;

  TenseGroup({
    required this.heading,
    required this.categories,
    required this.categoriesUrdu,
    required this.icon,
    required this.containerColor,
    required this.iconColor,
  });
}

class TenseType {
  final String name;
  final String nameUrdu;
  final String image;

  TenseType({required this.name, required this.nameUrdu, required this.image});
}
