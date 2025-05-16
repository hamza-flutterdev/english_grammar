import 'package:english_grammer/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/text_widget.dart';
import '../controller/home_screen_contrl.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.find<HomeScreenController>();

    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(0, 60),
        child: CustomAppBar(
          title: AppString.homeBar,
          textColor: Colors.white,
          textSize: 24,
          textWeight: FontWeight.w400,
        ),
      ),
      body:  Column(
        children: [
          SizedBox(height: 20,),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              mainAxisSpacing: 12,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.gridTitle.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.to(controller.screens[index]);
                },
                child: Container(
                  height: 86, width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFF075784)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.spa, color: Colors.orange,size: 34,),
                      SizedBox(height: 20,),
                      regularText(
                        textAlign: TextAlign.center,
                        textTitle: controller.gridTitle[index]['eng'],
                        textSize: 18, textColor: Colors.white,
                      ),
                      regularText(
                        textAlign: TextAlign.center,
                        textTitle: controller.gridTitle[index]['urd'],
                        textSize: 18, textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
