import 'package:english_grammer/presentation/conversation/view/conversation_view.dart';
import 'package:english_grammer/presentation/conversation_category/view/convesation_category.dart';
import 'package:english_grammer/presentation/grammar_categories/view/grammar_categories_view.dart';
import 'package:english_grammer/presentation/grammar_screen/view/grammar_view.dart';
import 'package:english_grammer/presentation/phrases/view/phrases_view.dart';
import 'package:english_grammer/presentation/splash/view/splash_view.dart';
import 'package:english_grammer/presentation/tenses/view/tenses_view.dart';
import 'package:english_grammer/presentation/tenses_categories/view/tenses_categories_view.dart';
import 'package:english_grammer/presentation/tenses_list/view/tenses_list_view.dart';
import 'package:english_grammer/presentation/vocabulary_screen/view/vocabulary_view.dart';
import 'package:english_grammer/presentation/vocabulory_category/view/vocabulory_category_view.dart';
import 'package:get/get.dart';

import '../../presentation/alphabet/view/alphabet_view.dart';
import '../../presentation/dictionary_view/view/dictionary_view.dart';
import '../../presentation/home/view/home_view.dart';
import 'app_routes.dart';

class RoutePages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashView()),
    GetPage(name: AppRoutes.home, page: () => HomeView()),
    GetPage(name: AppRoutes.phrases, page: () => PhrasesView()),
    GetPage(name: AppRoutes.vocabulary, page: () => VocabularyView()),
    GetPage(name: AppRoutes.grammar, page: () => GrammarView()),
    GetPage(name: AppRoutes.conversation, page: () => ConversationView()),
    GetPage(name: AppRoutes.dictionary, page: () => DictionaryView()),
    GetPage(name: AppRoutes.alphabet, page: () => AlphabetView()),
    GetPage(
      name: AppRoutes.grammarCategories,
      page: () => GrammarCategoriesView(),
    ),
    GetPage(name: AppRoutes.tenses, page: () => TensesView()),
    GetPage(name: AppRoutes.tensesList, page: () => TensesListView()),
    GetPage(
      name: AppRoutes.tensesCategories,
      page: () => TensesCategoriesView(),
    ),
    GetPage(
      name: AppRoutes.conversationCategory,
      page: () => ConversationCategoryView(),
    ),
    GetPage(
      name: AppRoutes.vocabularyCategory,
      page: () => VocabularyCategoryView(),
    ),
  ];
}
