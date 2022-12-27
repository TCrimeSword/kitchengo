import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_chickengo_husc/constants/colors.dart';
import 'package:mobile_chickengo_husc/constants/route_name.dart';
import 'package:mobile_chickengo_husc/icons/my_flutter_app_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_chickengo_husc/widgets/favorite_food.dart';
import 'package:mobile_chickengo_husc/widgets/layouts/layout.dart';

import '../../widgets/recently_viewed.dart';
import 'package:mobile_chickengo_husc/icons/my_flutter_app_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      bgColor: Colors.blue,
      selectedIndex: RouteName.homeScreenIndex,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Row(
                children: const [
                  Text(
                    'Mới xem gần đây',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Exo'),
                  ),
                  Icon(MyFlutterApp.rightdir)
                ],
              ),
            ),
            RecentlyViewed(),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: const [
                  Text(
                    'Nổi bật',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Exo'),
                  ),
                  Icon(MyFlutterApp.rightdir)
                ],
              ),
            ),
            FavoriteFood()
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Color.fromARGB(255, 255, 255, 255),
    //     //shadowColor: Color.fromARGB(255, 22, 58, 143),
    //     flexibleSpace: Container(
    //       decoration: const BoxDecoration(
    //           gradient: LinearGradient(colors: [
    //         ColorConstant.BlueMediumColor,
    //         ColorConstant.BlueBoldColor
    //       ], begin: Alignment.bottomLeft, end: Alignment.bottomRight)),
    //     ),
    //     title: const Text(
    //       "Katsudon",
    //       style: TextStyle(
    //           fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
    //     ),
    //     leading: IconButton(
    //       icon: const Icon(Icons.chevron_left),
    //       onPressed: () {},
    //     ),
    //     actions: [
    //       IconButton(
    //         icon: const Icon(Icons.favorite_border),
    //         onPressed: () {},
    //       ),
    //       IconButton(
    //         icon: const Icon(Icons.menu),
    //         onPressed: () {},
    //       )
    //     ],
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         FoodTitle(),
    //         Author(),
    //         DescriptioinFood(),
    //         TimePreparation(),
    //         Container(
    //             padding: EdgeInsets.only(top: 20, left: 15),
    //             child: Row(children: const [
    //               Text(
    //                 'Nguyên liệu',
    //                 style: TextStyle(
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.w700,
    //                     fontFamily: 'Exo'),
    //               ),
    //             ])),
    //         MealCount(),
    //         MealPreparation(),
    //         Container(
    //             padding: EdgeInsets.only(top: 20, left: 15),
    //             child: Row(children: const [
    //               Text(
    //                 'Hướng dẫn cách làm ',
    //                 style: TextStyle(
    //                     fontSize: 24,
    //                     fontWeight: FontWeight.w700,
    //                     fontFamily: 'Exo'),
    //               ),
    //             ])),
    //         Container(
    //           width: 380,
    //           padding: EdgeInsets.only(left: 10),
    //           child: Column(
    //             children: [
    //               IntroductionCooking(),
    //               Padding(padding: EdgeInsets.only(top: 30)),
    //               Container(
    //                 height: 60,
    //                 child: const Center(
    //                   child: Padding(
    //                     padding: EdgeInsets.all(20),
    //                     child: Text(
    //                       "Bắt đầu nấu nào",
    //                       style: TextStyle(
    //                           fontSize: 20,
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.w500,
    //                           fontFamily: 'Exo'),
    //                     ),
    //                   ),
    //                 ),
    //                 decoration: BoxDecoration(
    //                   gradient: const LinearGradient(
    //                       begin: Alignment.centerLeft,
    //                       end: Alignment.centerRight,
    //                       colors: [
    //                         ColorConstant.BlueBoldColor,
    //                         ColorConstant.BlueMediumColor,
    //                       ]),
    //                   borderRadius: BorderRadius.circular(30),
    //                   boxShadow: [
    //                     BoxShadow(
    //                         color: Colors.grey.withOpacity(0.5),
    //                         spreadRadius: 5,
    //                         blurRadius: 15.0,
    //                         offset:
    //                             Offset(0.0, 0.75) // changes position of shadow
    //                         ),
    //                   ],
    //                 ),
    //               ),
    //               Comments(),
    //               Container(
    //                   padding: EdgeInsets.only(top: 20, left: 5),
    //                   child: Row(children: const [
    //                     Text(
    //                       'Gợi ý  ',
    //                       style: TextStyle(
    //                           fontSize: 24,
    //                           fontWeight: FontWeight.w700,
    //                           fontFamily: 'Exo'),
    //                     ),
    //                   ])),
    //               RecentlyViewed()
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
