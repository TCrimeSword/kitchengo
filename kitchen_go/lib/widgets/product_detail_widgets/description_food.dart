import 'package:flutter/material.dart';

class DescriptioinFood extends StatelessWidget {
  DescriptioinFood({super.key, required this.description});
  String description;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 380,
            child: Padding(
              padding: EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Text(description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo')),
            ),
          ),
        ],
      ),
    );
  }
}
