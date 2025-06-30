import 'package:get/get.dart';

class GrammarCategoriesController extends GetxController {
  final List<Map<String, dynamic>> _initialItems;

  GrammarCategoriesController({required List<Map<String, dynamic>> items})
    : _initialItems = items;

  var items = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    items.value = _initialItems;
  }

  void filterItems(String query) {
    if (query.isEmpty) {
      items.value = _initialItems;
    } else {
      items.value =
          _initialItems.where((item) {
            final urdu = (item['urdu_words']?.toString() ?? '').toLowerCase();
            final english =
                (item['english_words']?.toString() ?? '').toLowerCase();
            final searchQuery = query.toLowerCase();
            return urdu.contains(searchQuery) || english.contains(searchQuery);
          }).toList();
    }
  }

  void resetItems() {
    items.value = _initialItems;
  }
}
