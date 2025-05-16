import 'package:english_grammer/presentation/conversation/controller/conversation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/text_widget.dart';


class ConversationView extends StatefulWidget {
  const ConversationView({super.key});

  @override
  State<ConversationView> createState() => _ConversationViewState();
}

class _ConversationViewState extends State<ConversationView> {
  final ConversationController controller = Get.put(ConversationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(0, 60),
        child: CustomAppBar(
          title: 'Conversations Screen',
          textColor: Colors.white,
          textSize: 24,
          textWeight: FontWeight.w400,
        ),
      ),
      body: Obx((){
        if(controller.conversationData.isEmpty){
          return Center(child: CircularProgressIndicator(),);
        }else {
          final filteredList = controller.conversationData.where((category){
            return category['category_name'] == 'Conversations';
          }).toList();
          return ListView.builder(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            final category = filteredList[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blueGrey.shade100),
                color: Colors.grey.shade100,
              ),
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child: regularText(textTitle: '${index+1}', textSize: 16, textColor: Colors.black)),
                title: regularText(
                    textTitle: category['english_words'] ?? '',
                    textSize: 18,
                    textColor: Colors.black,
                    textWeight: FontWeight.w600
                ),
                subtitle:  regularText(
                  textTitle: category['urdu_words'] ?? '',
                  textSize: 20,
                  textColor: Colors.blue,
                ),
                trailing: Icon(Icons.play_circle, color: Colors.blue,),
              ),
            );
          },
        );
      }}),
    );
  }
}
