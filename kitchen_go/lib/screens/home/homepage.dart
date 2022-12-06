import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  }
}
