import 'package:english_grammer/data/database/db_helper.dart';
import 'package:get/get.dart';

class ConversationController extends GetxController{
  final DbHelper dbHelper = DbHelper();

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchConversationData();
  }

  var conversationData = [].obs;

  List<String> dataList = [
    'Greetings',
    'Asking for Help and Directions',
    'How to Introduce Yourself',
    'Solving a Misunderstanding',
    'At Restaurant',
    'At the airport',
    'At the bank',
    'Accommodation',
    'At Hospital',
    'At Shop',
  ];

  Future<void> fetchConversationData() async{
    try{
      await dbHelper.initDatabase();
      conversationData.value = await dbHelper.fetchFamilyMembers(dataList);
    }catch(e){
      print("Error: $e");
    }
  }



}