
import 'package:get/get.dart';
import '../../../data/database/db_helper.dart';

class PhrasesController extends GetxController{
  final DbHelper dbHelper = DbHelper();


  @override
  void onInit() {
    super.onInit();
    fetchFamilyMembersData(); // Call the new function
  }


  var categories=[].obs;

  List<String> categoryTitle = [
    'While Meeting And Leaving Someone',
    'Say Thanks',
    'Wish Someone Something'
    'How to request someone',
    'Art of saying No to the people'
    'Party or Feast',
    'Functional Word & Phrases',
  ];

  Future<void> fetchFamilyMembersData() async{ // Renamed the function
    try{
      await dbHelper.initDatabase();
      categories.value = await dbHelper.fetchFamilyMembers(categoryTitle);
    }catch(e){
      print("Error: $e");
    }
  }
}
