import 'dart:ui';

class ConversationSection {
  //final String heading;
  final List<String> categories;

  ConversationSection({required this.categories});
}

class CategoryIcon {
  final String assetImage;
  final Color color;

  CategoryIcon({required this.assetImage, required this.color});
}
