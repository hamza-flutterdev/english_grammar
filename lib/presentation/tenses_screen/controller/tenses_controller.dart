import 'package:get/get.dart';

import '../../../data/database/db_helper.dart';

class TensesController extends GetxController {
  final DbHelper dbHelper = DbHelper();

  @override
  void onInit() {
    super.onInit();
    fetchFamilyMembersData(); // Call the new function
  }

  List<String> categoryTitle = [
    'Definition',
    'Affirmative Sentence',
    'Negative Sentence',
    'Interrogative Sentence',
  ];

  List<String> prTCategory = [
    'Present indefinite tense',
    'Present continuous tense',
    'Present perfect tense',
    'Present perfect continuous tense',
  ];

  List<String> psTCategory = [
    'Past indefinite tense',
    'Past continuous tense',
    'Past perfect tense',
    'Past perfect continuous tense',
  ];

  List<String> fuTCategory = [
    'Future indefinite tense',
    'Future continuous tense',
    'Future perfect tense',
    'Future perfect continuous tense',
  ];

  List<String> headingTitle = [
    'Present Tenses',
    'Future Tenses',
    'Past Tenses',
  ];

  var tensesCat = [].obs;

  Future<void> fetchFamilyMembersData() async {
    // Renamed the function
    try {
      await dbHelper.initDatabase();
      tensesCat.value = await dbHelper.fetchFamilyMembers(categoryTitle);
    } catch (e) {
      print("Error: $e");
    }
  }
}
