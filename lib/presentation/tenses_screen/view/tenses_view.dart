import 'package:english_grammer/core/widgets/text_widget.dart';
import 'package:english_grammer/presentation/tenses_screen/controller/tenses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/widgets/custom_appBar.dart';
import 'categoryNamesList.dart';

class TensesView extends StatefulWidget {
  @override
  State<TensesView> createState() => _TensesViewState();
}

class _TensesViewState extends State<TensesView> {
  final TensesController controller = Get.put(TensesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(0, 60),
        child: CustomAppBar(subtitle: 'English Tenses '),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              //  // 1st
              //  Container(
              //    height: 56, width: double.infinity,
              //    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //    decoration: BoxDecoration(
              //        borderRadius: BorderRadius.circular(10),
              //      color:  Color(0XFF25abc7),
              //    ),
              //    child: Center(
              //      child: Text(
              //        controller.headingTitle[index],
              //        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              //      ),
              //    ),
              //  ),
              // GridView.builder(
              //   shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: controller.prTCategory.length,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //       childAspectRatio: 2.4,
              //       mainAxisSpacing: 16
              //     ),
              //     itemBuilder: (context, index){
              //   return GestureDetector(
              //     onTap: (){
              //       Get.to(TensesCategoriesScreen(title:  controller.prTCategory[index],));
              //     },
              //     child: Container(
              //       width: 140,
              //       height: 100,
              //       margin: EdgeInsets.symmetric(horizontal: 10),
              //       decoration: BoxDecoration(
              //           color: Colors.grey.shade100.withValues(alpha: .7),
              //           borderRadius: BorderRadius.circular(10),
              //           border: Border.all(color: Colors.grey.shade200)
              //       ),
              //       child: Center(child: regularText(
              //           textAlign: TextAlign.center,
              //           textTitle: controller.prTCategory[index], textSize: 16, textColor: Colors.black)),
              //     ),
              //   );
              // }),

              // 2nd
              SizedBox(
                height: 600,
                width: double.infinity,
                child: TenseCategoryPager(),
              ),

              //
              //
              //
              //
              //
              //
              // Container(
              //   height: 56, width: double.infinity,
              //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color:  Color(0XFF25abc7),
              //   ),
              //   child: Center(
              //     child: Text(
              //       controller.headingTitle[2],
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              //     ),
              //   ),
              // ),
              // GridView.builder(
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: controller.psTCategory.length,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         childAspectRatio: 2.4,
              //         mainAxisSpacing: 16
              //     ),
              //     itemBuilder: (context, index){
              //       return GestureDetector(
              //         onTap: (){
              //           Get.to(TensesCategoriesScreen(title:  controller.psTCategory[index],));
              //         },
              //         child: Container(
              //           width: 140,
              //           height: 100,
              //           margin: EdgeInsets.symmetric(horizontal: 10),
              //           decoration: BoxDecoration(
              //               color: Colors.grey.shade100.withValues(alpha: .7),
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(color: Colors.grey.shade200)
              //           ),
              //           child: Center(child: regularText(
              //               textAlign: TextAlign.center,
              //               textTitle: controller.psTCategory[index], textSize: 16, textColor: Colors.black)),
              //         ),
              //       );
              //     }),
              // 3rd

              // Container(
              //   height: 56, width: double.infinity,
              //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color:  Color(0XFF25abc7),
              //   ),
              //   child: Center(
              //     child: Text(
              //       controller.headingTitle[1],
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              //     ),
              //   ),
              // ),
              // GridView.builder(
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: controller.fuTCategory.length,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         childAspectRatio: 2.4,
              //         mainAxisSpacing: 16
              //     ),
              //     itemBuilder: (context, index){
              //       return GestureDetector(
              //         onTap: (){
              //           Get.to(TensesCategoriesScreen(title:  controller.fuTCategory[index],));
              //         },
              //         child: Container(
              //           width: 140,
              //           height: 100,
              //           margin: EdgeInsets.symmetric(horizontal: 10),
              //           decoration: BoxDecoration(
              //               color: Colors.grey.shade100.withValues(alpha: .7),
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(color: Colors.grey.shade200)
              //           ),
              //           child: Center(child: regularText(
              //               textAlign: TextAlign.center,
              //               textTitle: controller.fuTCategory[index], textSize: 16, textColor: Colors.black)),
              //         ),
              //       );
              //     }),
              //
              //   SizedBox(height: 40,),
            ],
          );
        },
      ),
    );
  }
}

//
// class TenseCategoryPager extends StatefulWidget {
//   @override
//   _TenseCategoryPagerState createState() => _TenseCategoryPagerState();
// }
//
// class _TenseCategoryPagerState extends State<TenseCategoryPager> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   final List<String> tabTitles = [
//     'Past Indefinite',
//     'Past Continuous',
//     'Past Perfect',
//     'Past Perfect Continuous',
//   ];
//
//   final TensesController controller = Get.put(TensesController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 56,
//           width: double.infinity,
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: const Color(0XFF25abc7),
//           ),
//           child: Center(
//             child: Text(
//               controller.headingTitle[_currentPage],
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//           ),
//         ),
//
//         SizedBox(
//           height: 230,
//           child: PageView.builder(itemBuilder: (context, index){
//             return GestureDetector(
//               onTap: () {
//                 Get.to(() => TensesCategoriesScreen(title: controller.psTCategory[index]));
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     width: 240,
//                     height: 200,
//                     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade100.withOpacity(0.7),
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.grey.shade200),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(height: 16,),
//                         Center(
//                           child: Text(
//                             controller.psTCategory[index],
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w400),
//                           ),
//                         ),
//                         SizedBox(height: 16,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               height: 80,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                   color: Colors.pink.shade100,
//                                   shape: BoxShape.circle
//                               ),
//                               child: Center(child: regularText(
//                                   textAlign: TextAlign.center,
//                                   textTitle: 'Progress \n 0/4', textSize: 14,textWeight: FontWeight.w500)),
//                             ),
//                             Container(
//                               height: 80,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                   color: Colors.pink.shade100,
//                                   shape: BoxShape.circle
//                               ),
//                               child: Center(child: regularText(
//                                   textAlign: TextAlign.center,
//                                   textTitle: 'Progress \n 0/4', textSize: 14,textWeight: FontWeight.w500)),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//         ),
//
//         SizedBox(height: 20,),
//         SmoothPageIndicator(
//           controller: _pageController,
//           count: 4,
//           effect: WormEffect(
//             activeDotColor: Color(0XFF25abc7),
//             dotColor: Colors.grey.shade300,
//             dotHeight: 10,
//             dotWidth: 10,
//           ),
//         ),
//         const SizedBox(height: 10),
//         SizedBox(
//           height: 40,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: tabTitles.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   _pageController.animateToPage(index,
//                       duration: const Duration(milliseconds: 400),
//                       curve: Curves.easeInOut);
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   margin: const EdgeInsets.symmetric(horizontal: 6),
//                   decoration: BoxDecoration(
//                     color: _currentPage == index ? Color(0XFF25abc7) : Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     tabTitles[index],
//                     style: TextStyle(
//                       color: _currentPage == index ? Colors.white : Colors.black,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }
// }

class TenseCategoryPager extends StatefulWidget {
  @override
  _TenseCategoryPagerState createState() => _TenseCategoryPagerState();
}

class _TenseCategoryPagerState extends State<TenseCategoryPager> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> tabTitlesEN = [
    'Past Indefinite',
    'Past Continuous',
    'Past Perfect',
    'Past Perfect Continuous',
  ];
  final List<String> tabTitlesUR = [
    'ماضی غیر معینہ مدت',
    'ماضی کا مسلسل تناؤ',
    'ماضی کا مسلسل تناؤ',
    'ماضی کامل مسلسل تناؤ',
  ];

  final TensesController controller = Get.put(TensesController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0XFF25abc7),
          ),
          child: Center(
            child: Text(
              controller.psTCategory[_currentPage],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        SizedBox(
          height: 230,
          child: PageView.builder(
            controller: _pageController,
            itemCount: controller.psTCategory.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => TensesCategoriesScreen(
                      title: controller.psTCategory[index],
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 240,
                      height: 200,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              controller.psTCategory[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),
                          regularText(
                            textTitle: tabTitlesUR[index],
                            textSize: 20,
                            textColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),
        SmoothPageIndicator(
          controller: _pageController,
          count: controller.psTCategory.length,
          effect: WormEffect(
            activeDotColor: const Color(0XFF25abc7),
            dotColor: Colors.grey.shade300,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),

        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tabTitlesEN.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index
                            ? const Color(0XFF25abc7)
                            : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tabTitlesEN[index],
                    style: TextStyle(
                      color:
                          _currentPage == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
