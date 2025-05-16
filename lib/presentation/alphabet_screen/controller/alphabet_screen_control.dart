

import 'package:english_grammer/data/database/db_helper.dart';
import 'package:get/get.dart';

class AlphabetsController extends GetxController{
  final DbHelper dbHelper = DbHelper();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAlphabetsData();
  }


  var alphabetCateg = [].obs;
  List<String> categoryTitle = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
    'U', 'V', 'W', 'X', 'Y', 'Z'
  ];


  Future<void> fetchAlphabetsData() async{
    try{
      await dbHelper.initDatabase();
      alphabetCateg.value = await dbHelper.fetchFamilyMembers(categoryTitle);
    }catch(e){
      print('Error: $e');
    }
  }





}