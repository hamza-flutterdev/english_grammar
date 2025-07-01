import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/data/database/db_helper.dart';
import '../../../core/service/ai_service.dart';

class DictionaryController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final DbHelper _dbHelper = DbHelper();
  final AiService _aiService = AiService();

  var searchResults = <Map<String, dynamic>>[].obs;
  var selectedWord = ''.obs;
  var selectedMeaning = ''.obs;
  var isSearching = false.obs;
  var hasSearched = false.obs;
  var isLoadingAiDetails = false.obs;
  var aiResponse = ''.obs;
  var aiError = ''.obs;
  var wordDetails = Rxn<WordDetails>();

  @override
  void onInit() {
    super.onInit();
    _initializeDatabase();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> _initializeDatabase() async {
    await _dbHelper.initDatabase();
  }

  Future<void> performSearch(String query) async {
    if (query.trim().isEmpty) {
      searchResults.clear();
      hasSearched.value = false;
      return;
    }

    isSearching.value = true;
    hasSearched.value = true;

    try {
      final results = await _dbHelper.searchWord(query);
      searchResults.assignAll(results);

      if (results.isEmpty) {
        Fluttertoast.showToast(
          msg: "No word in dictionary. Try another word.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }

      selectedWord.value = '';
      selectedMeaning.value = '';
      _clearAiDetails();
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error searching word: ${e.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } finally {
      isSearching.value = false;
    }
  }

  Future<void> onWordTap(String word, String meaning) async {
    selectedWord.value = word;
    selectedMeaning.value = meaning;
    searchController.clear();
    searchResults.clear();
    hasSearched.value = false;
    Get.focusScope?.unfocus();
    await getWordDetails(extractEnglishWord(meaning));
  }

  String extractEnglishWord(String meaning) {
    final words = meaning.split(' ');
    for (String word in words) {
      String cleanWord = word.replaceAll(RegExp(r'[^\w]'), '');
      if (cleanWord.isNotEmpty && RegExp(r'^[a-zA-Z]+$').hasMatch(cleanWord)) {
        return cleanWord.toLowerCase();
      }
    }
    return selectedWord.value;
  }

  Future<void> getWordDetails(String word) async {
    if (word.trim().isEmpty) return;

    isLoadingAiDetails.value = true;
    aiError.value = '';
    aiResponse.value = '';
    wordDetails.value = null;

    try {
      final systemPrompt =
          '''You are a concise English dictionary assistant. For the word provided, give brief but comprehensive information in plain text format:

Definition: [Clear, concise definition]
Part of Speech: [Grammar type]
Pronunciation: [Phonetic guide]
Examples: [3 short example sentences]
Synonyms: [5-6 synonyms]
Antonyms: [5-6 antonyms]

Keep responses under 200 words. Use simple plain text without any special formatting or symbols. Be direct and informative.''';

      final messages = [
        {"role": "system", "content": systemPrompt},
        {"role": "user", "content": "Provide information about: $word"},
      ];

      final response = await _aiService.sendMessage(messages);
      aiResponse.value = response;

      _parseAiResponse(response);
    } catch (e) {
      aiError.value = "Error getting word details: ${e.toString()}";
    } finally {
      isLoadingAiDetails.value = false;
    }
  }

  void _parseAiResponse(String response) {
    try {
      final Map<String, String> sections = {
        'definition': '',
        'partOfSpeech': '',
        'pronunciation': '',
        'examples': '',
        'synonyms': '',
        'antonyms': '',
      };

      final lines = response.split('\n');
      String currentSection = '';

      for (var line in lines) {
        final trimmedLine = line.trim();
        if (trimmedLine.isEmpty) continue;

        final separatorIndex = trimmedLine.indexOf(':');
        if (separatorIndex != -1) {
          final key = trimmedLine.substring(0, separatorIndex).toLowerCase();
          final value = trimmedLine.substring(separatorIndex + 1).trim();

          switch (key) {
            case 'definition':
            case 'part of speech':
            case 'pronunciation':
            case 'examples':
            case 'synonyms':
            case 'antonyms':
              currentSection = key;
              sections[_normalizeKey(key)] = value;
              break;
            default:
              currentSection = '';
          }
        } else if (currentSection == 'examples') {
          sections['examples'] = '${sections['examples'] ?? ''}\n$trimmedLine';
        }
      }

      wordDetails.value = WordDetails(
        definition: _fallback(
          sections['definition'],
          'No definition available',
        ),
        partOfSpeech: _fallback(sections['partOfSpeech'], 'Not specified'),
        pronunciation: _fallback(sections['pronunciation'], 'Not available'),
        examples: _fallback(sections['examples'], 'No examples available'),
        synonyms: _fallback(sections['synonyms'], 'No synonyms available'),
        antonyms: _fallback(sections['antonyms'], 'No antonyms available'),
      );
    } catch (e) {
      debugPrint('Error parsing AI response: $e');
    }
  }

  String _fallback(String? value, String fallback) =>
      (value == null || value.trim().isEmpty) ? fallback : value.trim();

  String _normalizeKey(String key) {
    return key
        .replaceAll(' ', '')
        .replaceAllMapped(
          RegExp(r'^[a-z]'),
          (match) => match.group(0)!.toLowerCase(),
        );
  }

  void _clearAiDetails() {
    aiResponse.value = '';
    aiError.value = '';
    isLoadingAiDetails.value = false;
    wordDetails.value = null;
  }

  void clearSearch() {
    searchController.clear();
    searchResults.clear();
    selectedWord.value = '';
    selectedMeaning.value = '';
    hasSearched.value = false;
    _clearAiDetails();
  }

  void copyToClipboard(String text) {
    if (text.trim().isNotEmpty) {
      Clipboard.setData(ClipboardData(text: text));
    }
  }
}

/*
Wrong place use this.....??
*/
class WordDetails {
  final String definition;
  final String partOfSpeech;
  final String pronunciation;
  final String examples;
  final String synonyms;
  final String antonyms;

  WordDetails({
    required this.definition,
    required this.partOfSpeech,
    required this.pronunciation,
    required this.examples,
    required this.synonyms,
    required this.antonyms,
  });
}
