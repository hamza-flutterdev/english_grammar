
import 'package:english_grammer/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../controller/vocabulary_controller.dart'; // Corrected import

class VocabularyView extends StatelessWidget {
  final VocabularyController contrl = Get.put(VocabularyController()); // Instantiate the correct controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 60),
        child: CustomAppBar(
          title: 'English Vocabulary',

          textColor: Colors.white,
          textSize: 24,
          textWeight: FontWeight.w400,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1st
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.056,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:  Color(0XFF25abc7),
              ),
                child: Center(child: regularText(textTitle: contrl.headingTitle[0], textSize: 20, textColor: Colors.white))),
            Obx(() {
              if (contrl.categories1.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.4,
                    mainAxisSpacing: 12,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:contrl.categoryTitle.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(VocabularyCategoryScreen(
                          title:contrl.categoryTitle[index],
                        ));
                      },
                      child: Container(
                        height: 86, width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueGrey.shade100),
                            color: Colors.grey.shade200,
                        ),
                        child: Center(child:  regularText(
                            textTitle: contrl.categoryTitle[index],
                            textSize: 18, textColor: Colors.black,
                        )),
                      ),
                    );
                  },
                );
              }
            }),

            // 2nd
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.056,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0XFF25abc7),
              ),
                child: Center(child: regularText(textTitle: contrl.headingTitle[1], textSize: 20, textColor: Colors.white))),
            Obx(() {
              if (contrl.categories2.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.4,
                    mainAxisSpacing: 12,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:contrl.categoryTitle2.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(VocabularyCategoryScreen(title:contrl.categoryTitle2[index],));
                      },
                      child: Container(
                        height: 86, width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(child:  regularText(
                            textTitle: contrl.categoryTitle2[index],
                            textSize: 18, textColor: Colors.black,
                        )),
                      ),
                    );
                  },
                );
              }
            }),

            // 3rd
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.056,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  Color(0XFF25abc7),
                ),
                child: Center(child: regularText(textTitle: contrl.headingTitle[2], textSize: 20, textColor: Colors.white))),
            Obx(() {
              if (contrl.categories3.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.4,
                    mainAxisSpacing: 12,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:contrl.categoryTitle3.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(VocabularyCategoryScreen(title:contrl.categoryTitle3[index],));
                      },
                      child: Container(
                        height: 86, width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(child:  regularText(
                          textAlign: TextAlign.center,
                          textTitle: contrl.categoryTitle3[index],
                          textSize: 18, textColor: Colors.black,
                        )),
                      ),
                    );
                  },
                );
              }
            }),

            // 4th
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.056,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color:  Color(0XFF25abc7),
                ),
                child: Center(child: regularText(textTitle: contrl.headingTitle[3], textSize: 20, textColor: Colors.white))),
            Obx(() {
              if (contrl.categories4.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.4,
                    mainAxisSpacing: 12,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:contrl.categoryTitle4.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(VocabularyCategoryScreen(title:contrl.categoryTitle4[index],));
                      },
                      child: Container(
                        height: 86, width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(child:  regularText(
                          textTitle: contrl.categoryTitle4[index],
                          textSize: 18, textColor: Colors.black,
                        )),
                      ),
                    );
                  },
                );
              }
            }),

            // 5th
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.056,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color:  Color(0XFF25abc7),
                ),
                child: Center(child: regularText(textTitle: contrl.headingTitle[4], textSize: 20, textColor: Colors.white))),
            Obx(() {
              if (contrl.categories5.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.4,
                    mainAxisSpacing: 12,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:contrl.categoryTitle5.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(VocabularyCategoryScreen(title:contrl.categoryTitle5[index],));
                      },
                      child: Container(
                        height: 86, width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(child:  regularText(
                          textAlign: TextAlign.center,
                          textTitle: contrl.categoryTitle5[index],
                          textSize: 18, textColor: Colors.black,
                        )),
                      ),
                    );
                  },
                );
              }
            }),

            // 6th
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.056,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color:  Color(0XFF25abc7),
                ),
                child: Center(child: regularText(textTitle: contrl.headingTitle[5], textSize: 20, textColor: Colors.white))),
            Obx(() {
              if (contrl.categories6.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.4,
                    mainAxisSpacing: 12,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:contrl.categoryTitle6.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(VocabularyCategoryScreen(title:contrl.categoryTitle6[index],));
                      },
                      child: Container(
                        height: 86, width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(child:  regularText(
                          textAlign: TextAlign.center,
                          textTitle: contrl.categoryTitle6[index],
                          textSize: 18, textColor: Colors.black,
                        )),
                      ),
                    );
                  },
                );
              }
            }),

            // 7th
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.056,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color:  Color(0XFF25abc7),
                ),
                child: Center(child: regularText(textTitle: contrl.headingTitle[6], textSize: 20, textColor: Colors.white))),
            Obx(() {
              if (contrl.categories7.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.4,
                    mainAxisSpacing: 12,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:contrl.categoryTitle7.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(VocabularyCategoryScreen(title:contrl.categoryTitle7[index],));
                      },
                      child: Container(
                        height: 86, width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(child:  regularText(
                          textAlign: TextAlign.center,
                          textTitle: contrl.categoryTitle7[index],
                          textSize: 18, textColor: Colors.black,
                        )),
                      ),
                    );
                  },
                );
              }
            }),

          ],
        ),
      ),
    );
  }
}


class VocabularyCategoryScreen extends StatefulWidget {
  final String title;
  const VocabularyCategoryScreen({super.key,
    required this.title,});
  @override
  State<VocabularyCategoryScreen> createState() => _VocabularyCategoryScreenState();
}

class _VocabularyCategoryScreenState extends State<VocabularyCategoryScreen> {
  final VocabularyController controller = Get.put(VocabularyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 60),
        child: CustomAppBar(
          title: widget.title,

          textColor: Colors.white,
          textSize: 24,
          textWeight: FontWeight.w400,
        ),
      ),
      body: ListView(
        children: [
          Obx(() {
            if (controller.categories1.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              final filteredList = controller.categories1.where((category) {
                return category['subCategory'] == widget.title;
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
                        textSize: 18,
                        textColor: Colors.blue,
                      ),
                      trailing: Icon(Icons.play_circle, color: Colors.blue,),
                    ),
                  );
                },
              );
            }
          }),
          Obx(() {
            if (controller.categories2.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              final filteredList = controller.categories2.where((category) {
                return category['subCategory'] == widget.title;
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
                        textSize: 18,
                        textColor: Colors.blue,
                      ),
                      trailing: Icon(Icons.play_circle, color: Colors.blue,),
                    ),
                  );
                },
              );
            }
          }),

          Obx(() {
            if (controller.categories3.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              final filteredList = controller.categories3.where((category) {
                return category['subCategory'] == widget.title;
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
                        textSize: 18,
                        textColor: Colors.blue,
                      ),
                      trailing: Icon(Icons.play_circle, color: Colors.blue,),
                    ),
                  );
                },
              );
            }
          }),
          Obx(() {
            if (controller.categories4.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              final filteredList = controller.categories4.where((category) {
                return category['subCategory'] == widget.title;
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
                        textSize: 18,
                        textColor: Colors.blue,
                      ),
                      trailing: Icon(Icons.play_circle, color: Colors.blue,),
                    ),
                  );
                },
              );
            }
          }),

          Obx(() {
            if (controller.categories5.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              final filteredList = controller.categories5.where((category) {
                return category['subCategory'] == widget.title;
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
                        textSize: 18,
                        textColor: Colors.blue,
                      ),
                      trailing: Icon(Icons.play_circle, color: Colors.blue,),
                    ),
                  );
                },
              );
            }
          }),
          Obx(() {
            if (controller.categories6.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              final filteredList = controller.categories6.where((category) {
                return category['subCategory'] == widget.title;
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
                        textSize: 18,
                        textColor: Colors.blue,
                      ),
                      trailing: Icon(Icons.play_circle, color: Colors.blue,),
                    ),
                  );
                },
              );
            }
          }),

          Obx(() {
            if (controller.categories7.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              final filteredList = controller.categories7.where((category) {
                return category['subCategory'] == widget.title;
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
                        textSize: 18,
                        textColor: Colors.blue,
                      ),
                      trailing: Icon(Icons.play_circle, color: Colors.blue,),
                    ),
                  );
                },
              );
            }
          }),

        ],
      )
    );
  }
}
