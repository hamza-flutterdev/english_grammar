
import 'package:english_grammer/data/database/db_helper.dart';
import 'package:get/get.dart';

class GrammerController extends GetxController {
  final DbHelper dbHelper = DbHelper();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchGrammarData();
  }

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


  Future<void> fetchGrammarData() async{
    try{
      await dbHelper.initDatabase();
      grammar.value = await dbHelper.fetchFamilyMembers(grammarTitle);
    }catch(e){}
  }

}
