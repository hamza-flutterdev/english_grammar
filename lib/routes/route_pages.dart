import 'package:english_grammer/presentation/alphabet_screen/view/alphabet_screen_view.dart';
import 'package:english_grammer/presentation/conversation/view/conversation_view.dart';
import 'package:english_grammer/presentation/dictionary_screen/view/dictionary_screen_view.dart';
import 'package:english_grammer/presentation/grammar_screen/view/grammar_screen_view.dart';
import 'package:english_grammer/presentation/phrases_screen/view/phrases_view.dart';
import 'package:english_grammer/presentation/vocabulary_screen/view/vocabulary_view.dart';
import 'package:english_grammer/routes/app_routes.dart';
import 'package:get/get.dart';
import '../presentation/home_screen/view/home_screen_view.dart';
import '../presentation/splash_screen/view/splash_screen_view.dart';

class RoutePages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.phrases, page: () => PhrasesCategoryScreen()),
    GetPage(name: AppRoutes.vocabulary, page: () => VocabularyView()),
    GetPage(name: AppRoutes.grammar, page: () => GrammarView()),
    GetPage(name: AppRoutes.conversation, page: () => ConversationView()),
    GetPage(name: AppRoutes.dictionary, page: () => DictionarySearchScreen()),
    GetPage(name: AppRoutes.alphabet, page: () => AlphabetScreenView()),
  ];
}
