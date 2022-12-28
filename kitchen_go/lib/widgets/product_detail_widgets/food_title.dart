import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/api.dart';

class FoodTitle extends StatelessWidget {
  FoodTitle({super.key, required this.title, required this.image});
  String title;
  String image;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Row(children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Exo'),
                ),
              ])),
          Container(
            padding: EdgeInsets.only(top: 5, left: 15, right: 15),
            child: Image.network(
              Api.getImageUrl(image),
              fit: BoxFit.cover,
              scale: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
