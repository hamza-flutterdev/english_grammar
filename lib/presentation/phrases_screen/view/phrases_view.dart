import 'package:english_grammer/core/widgets/custom_drawer.dart';
import 'package:english_grammer/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import '../../../core/constants/constant.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/bg_circular.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/custom_toast.dart';
import '../../../core/widgets/icon_buttons.dart';
import '../../vocabulary_screen/controller/vocabulary_controller.dart';
import '../controller/phrases_controller.dart';

class PhrasesCategoryScreen extends StatefulWidget {
  @override
  State<PhrasesCategoryScreen> createState() => _PhrasesCategoryScreenState();
}

class _PhrasesCategoryScreenState extends State<PhrasesCategoryScreen> {
  final PhrasesController controller = Get.put(PhrasesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size(0, 60),
      //   child: CustomAppBar(
      //     title: 'English Phrases',
      //
      //     textColor: Colors.white,
      //     textSize: 24,
      //     textWeight: FontWeight.w400,
      //   ),
      // ),
      body: Stack(
        children: [
          const BackgroundCircles(),
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BackIconButton(),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    "Güncel Durum",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80, left: kBodyHp, right: kBodyHp),
            child: Obx(() {
              if (controller.categories.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                final filteredList =
                    controller.categories.where((category) {
                      return category['category_name'] == 'Phrases';
                    }).toList();
                return ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final category = filteredList[index];
                    return Container(
                      decoration: roundedDecoration,
                      width: double.maxFinite,
                      // padding: const EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 14,
                          child: regularText(
                            textTitle: '${index + 1}',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                        ),
                        trailing: Icon(Icons.play_circle, color: Colors.blue),
                        title: regularText(
                          textTitle: category['english_words'] ?? '',
                          textSize: 18,
                          textColor: Colors.black,
                          textWeight: FontWeight.w600,
                        ),
                        subtitle: regularText(
                          textTitle: category['urdu_words'] ?? '',
                          textSize: 16,
                          textColor: Colors.blue,
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
