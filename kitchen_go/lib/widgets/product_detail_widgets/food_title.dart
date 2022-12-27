import 'package:flutter/material.dart';

class FoodTitle extends StatelessWidget {
  const FoodTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Row(children: const [
                Text(
                  'Katsudon',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Exo'),
                ),
              ])),
          Container(
            padding: EdgeInsets.only(top: 5, left: 15, right: 15),
            child: Image.asset(
              'assets/images/Rectangle01.png',
              fit: BoxFit.cover,
              scale: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
