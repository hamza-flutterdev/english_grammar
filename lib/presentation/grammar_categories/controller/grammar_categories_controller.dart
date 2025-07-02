import 'package:get/get.dart';

class GrammarCategoriesController extends GetxController {
  final List<Map<String, dynamic>> _initialItems;

  GrammarCategoriesController({required List<Map<String, dynamic>> items})
    : _initialItems = items;

  var items = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var showUrdu = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadItems();
  }

  Future<void> _loadItems() async {
    await Future.delayed(const Duration(milliseconds: 400));
    items.value = _initialItems;
    isLoading.value = false;
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

  void toggleUrdu() {
    showUrdu.value = !showUrdu.value;
  }

  void resetItems() {
    items.value = _initialItems;
  }
}
