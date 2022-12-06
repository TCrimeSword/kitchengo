import 'package:flutter/material.dart';
import 'package:mobile_chickengo_husc/constants/colors.dart';
import 'package:mobile_chickengo_husc/widgets/layouts/bottom_nav.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    required this.bgColor,
    this.title,
    required this.child,
    required this.selectedIndex,
  });
  final Color bgColor;
  final String? title;
  final Widget child;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            Container(
              
              width: double.infinity,
              color: ColorConstant.BlueBoldColor,
            ),
            const Text(
              'Title',
              style: TextStyle(
                fontSize: 22.0,
                color: ColorConstant.BlueBoldColor,
              ),
            ),
          ],
        ),
        backgroundColor: bgColor,
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigation(selectedIndex: selectedIndex),
    );
  }
}
