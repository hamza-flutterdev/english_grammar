import 'package:english_grammer/presentation/alphabet_screen/controller/alphabet_screen_control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/text_widget.dart';


class AlphabetScreenView extends StatefulWidget {
  const AlphabetScreenView({super.key});

  @override
  State<AlphabetScreenView> createState() => _AlphabetScreenViewState();
}

class _AlphabetScreenViewState extends State<AlphabetScreenView> {
  final AlphabetsController controller = Get.put(AlphabetsController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(0, 60),
        child: CustomAppBar(
          title: 'Alphabet Screen',
          textColor: Colors.white,
          textSize: 24,
          textWeight: FontWeight.w400,
        ),
      ),
      body: Obx(() {
        if (controller.alphabetCateg.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          final filteredList = controller.alphabetCateg.where((category) {
            return category['category_name'] == 'vocabulary2';
          }).toList();
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final category = filteredList[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100.withValues(alpha: .7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200)
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
                    textSize: 16,
                    textColor: Colors.blue,
                  ),
                  trailing: Icon(Icons.play_circle, color: Colors.blue,),
                ),
              );
            },
          );
        }
      })
    );
  }
}
