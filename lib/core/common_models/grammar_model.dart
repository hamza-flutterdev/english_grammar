import 'dart:ui';

class CategoryItem {
  final String assetPath;
  final String text;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  CategoryItem({
    required this.assetPath,
    required this.text,
    required this.iconColor,
    required this.backgroundColor,
    this.onTap,
  });
}
