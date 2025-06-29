import 'package:english_grammer/data/database/db_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GrammarController extends GetxController {
  final DbHelper dbHelper = DbHelper();
  var grammar = [].obs;

  final List<String> grammarTitle = [
    'Function or Job',
    'Example Words',
    'Example Sentences',
  ];

  final List<String> grammarData = [
    'Verb',
    'Noun',
    'Adjective',
    'Adverb',
    'Pronoun',
    'Preposition',
    'Conjunction',
    'Interjection',
  ];

  Map<String, List<Map<String, dynamic>>> get groupedData {
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var item in grammar) {
      final category = item['category_name'] ?? 'Unknown';
      grouped.putIfAbsent(category, () => []).add(item);
    }
    return grouped;
  }

  @override
  void onInit() {
    super.onInit();
    fetchGrammarData();
  }

  Future<void> fetchGrammarData() async {
    try {
      await dbHelper.initDatabase();
      grammar.value = await dbHelper.fetchBySubcategories(grammarTitle);
    } catch (e) {
      debugPrint('Error fetching grammar data: $e');
    }
  }
}
