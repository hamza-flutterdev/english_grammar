import 'package:english_grammer/presentation/alphabet_screen/view/alphabet_screen_view.dart';
import 'package:english_grammer/presentation/conversation/view/conversation_view.dart';
import 'package:english_grammer/presentation/conversation_category/view/convesation_category_screen.dart';
import 'package:english_grammer/presentation/dictionary_screen/view/dictionary_screen_view.dart';
import 'package:english_grammer/presentation/grammar_categories/view/grammar_categories.dart';
import 'package:english_grammer/presentation/grammar_screen/view/grammar_screen_view.dart';
import 'package:english_grammer/presentation/phrases_screen/view/phrases_view.dart';
import 'package:english_grammer/presentation/vocabulary_screen/view/vocabulary_view.dart';
import 'package:english_grammer/presentation/vocabulory_category/view/vocabulory_category_screen.dart';
import 'package:english_grammer/routes/app_routes.dart';
import 'package:get/get.dart';
import '../presentation/home_screen/view/home_screen_view.dart';
import '../presentation/splash_screen/view/splash_screen_view.dart';
import '../presentation/tenses_screen/view/tenses_view.dart';

class RoutePages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.phrases, page: () => PhrasesScreen()),
    GetPage(name: AppRoutes.vocabulary, page: () => VocabularyView()),
    GetPage(name: AppRoutes.grammar, page: () => GrammarView()),
    GetPage(name: AppRoutes.conversation, page: () => ConversationView()),
    GetPage(name: AppRoutes.dictionary, page: () => DictionarySearchScreen()),
    GetPage(name: AppRoutes.alphabet, page: () => AlphabetScreenView()),
    GetPage(name: AppRoutes.grammarDetail, page: () => GrammarDetailView()),
    GetPage(name: AppRoutes.tenses, page: () => TensesView()),
    GetPage(
      name: AppRoutes.conversationCategory,
      page: () => ConversationCategoryScreen(),
    ),
    GetPage(
      name: AppRoutes.vocabularyCategory,
      page: () => VocabularyCategoryScreen(),
    ),
  ];
}
