// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../../../data/database/db_helper.dart';
//
// class DictionaryController extends GetxController {
//   final TextEditingController searchController = TextEditingController();
//   final DbHelper _dbHelper = DbHelper();
//
//   var searchResults = <Map<String, dynamic>>[].obs;
//   var selectedWord = ''.obs;
//   var selectedMeaning = ''.obs;
//   var showSuggestions = true.obs;
//
//   Timer? _debounce;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _dbHelper.initDatabase();
//   }
//
//   void performSearch(String query) {
//     // Guard: don't search if suggestions are turned off
//     if (!showSuggestions.value) return;
//
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//
//     _debounce = Timer(const Duration(milliseconds: 300), () async {
//       final trimmedQuery = query.trim();
//
//       if (trimmedQuery.isEmpty) {
//         searchResults.clear();
//         selectedWord.value = '';
//         selectedMeaning.value = '';
//         showSuggestions.value = false;
//         return;
//       }
//
//       final results = await _dbHelper.searchWord(trimmedQuery);
//       if (results.isEmpty) {
//         Fluttertoast.showToast(msg: "No word in dictionary. Try another word.");
//       }
//
//       searchResults.value = results;
//       selectedWord.value = '';
//       selectedMeaning.value = '';
//       showSuggestions.value = true;
//     });
//   }
//
//   void onWordTap(BuildContext context, String word, String meaning) {
//     selectedWord.value = word;
//     selectedMeaning.value = meaning;
//
//     searchController.clear();
//     searchResults.clear();
//     showSuggestions.value = false;
//
//     // Hide keyboard
//     FocusScope.of(context).unfocus();
//   }
//
//   @override
//   void onClose() {
//     _debounce?.cancel();
//     super.onClose();
//   }
// }
