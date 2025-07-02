import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/data/database/db_helper.dart';
import '../../../core/local_storage/shared_pref.dart';
import '../../conversation/controller/conversation_controller.dart';

class ConversationCategoryController extends GetxController {
  final DbHelper dbHelper = DbHelper();
  var conversations = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  final SharedPrefsService prefsService = SharedPrefsService();
  String? currentCategory;

  String getSpokenItemsKey(String category) => 'spoken_items_$category';
  String getSpeakCountKey(String category) => 'speak_count_$category';

  Future<void> loadConversations(String categoryTitle) async {
    try {
      isLoading.value = true;
      currentCategory = categoryTitle;
      await prefsService.init();
      await prefsService.loadKeys([
        getSpeakCountKey(categoryTitle),
        getSpokenItemsKey(categoryTitle),
      ]);
      await dbHelper.initDatabase();
      await Future.delayed(const Duration(milliseconds: 400));
      final data = await dbHelper.fetchBySubcategories([categoryTitle]);
      final filteredConversations =
          data
              .where((item) => item['subCategory'] == categoryTitle)
              .cast<Map<String, dynamic>>()
              .toList();
      conversations.assignAll(filteredConversations);
      isLoading.value = false;
    } catch (e) {
      debugPrint("Error loading conversations: $e");
      isLoading.value = false;
    }
  }

  Future<void> onSpeakButtonPressed(String itemId) async {
    if (currentCategory == null) return;

    final spokenItemsKey = getSpokenItemsKey(currentCategory!);
    final countKey = getSpeakCountKey(currentCategory!);

    final wasAlreadySpoken = prefsService.isInStringList(
      spokenItemsKey,
      itemId,
    );

    if (!wasAlreadySpoken) {
      await prefsService.addToStringList(spokenItemsKey, itemId);
      final newCount = prefsService.getStringListCount(spokenItemsKey);
      await prefsService.setValue<int>(countKey, newCount);

      await _refreshConversationController();

      debugPrint(
        'Item $itemId marked as spoken in $currentCategory. Total unique items: $newCount',
      );
    } else {
      debugPrint('Item $itemId already spoken in $currentCategory');
    }
  }

  Future<void> _refreshConversationController() async {
    try {
      if (Get.isRegistered<ConversationController>()) {
        await Get.find<ConversationController>().refreshSpeakCounts();
        debugPrint('ConversationController speak counts refreshed');
      }
    } catch (e) {
      debugPrint('Failed to refresh ConversationController: $e');
    }
  }

  bool hasItemBeenSpoken(String itemId) {
    if (currentCategory == null) return false;
    return prefsService.isInStringList(
      getSpokenItemsKey(currentCategory!),
      itemId,
    );
  }

  int getCurrentSpeakCount() {
    if (currentCategory == null) return 0;
    return prefsService.getValue<int>(getSpeakCountKey(currentCategory!), 0);
  }

  Future<void> resetCurrentSpeakCount() async {
    if (currentCategory == null) return;
    await prefsService.setStringList(getSpokenItemsKey(currentCategory!), []);
    await prefsService.setValue<int>(getSpeakCountKey(currentCategory!), 0);

    await _refreshConversationController();
  }
}
