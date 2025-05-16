
import 'package:english_grammer/presentation/grammar_screen/view/grammar_screen_view.dart';
import 'package:english_grammer/presentation/phrases_screen/view/phrases_view.dart';
import 'package:english_grammer/presentation/tenses_screen/view/tenses_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/custom_toast.dart';
import '../../alphabet_screen/view/alphabet_screen_view.dart';
import '../../conversation/view/conversation_view.dart';
import '../../dictionary_screen/view/dictionary_screen_view.dart';
import '../../vocabulary_screen/view/vocabulary_view.dart';


class HomeScreenController extends GetxController {
  RxInt currentIndex = 0.obs;

  late final List<Widget> screens;

final List<Map<String, dynamic>> gridTitle = [
  {'eng': 'Alphabets','urd': 'آلفاز' },
  {'eng': 'Vocabulary','urd': 'ذخیرہ الفاظ' },
  {'eng': 'Phrases','urd': 'جملے' },
  {'eng': 'Grammar','urd': 'گرامر' },
  {'eng': 'Conversation','urd': 'بات چیت' },
  {'eng': 'Tenses','urd': 'زمانہ' },
  {'eng': 'Dictionary', 'urd': 'لغت'}

];

  @override
  void onInit() {
    screens = [
      AlphabetScreenView(),
      VocabularyView(),
      PhrasesCategoryScreen(), // PhrasesView(),
      GrammarView(),
      ConversationView(),
      TensesView(),
      // DictionaryScreenView()
      DictionarySearchScreen(),
    ];
    super.onInit();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}


