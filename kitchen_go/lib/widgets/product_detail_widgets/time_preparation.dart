import 'package:flutter/material.dart';

class TimePreparation extends StatelessWidget {
  const TimePreparation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: Row(
              children: const [
                Icon(Icons.timer_outlined),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  "Thời gian chuẩn bị:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  "20 phút",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Exo'),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, top: 5),
            child: Row(
              children: const [
                Icon(Icons.timer_outlined),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  "Thời gian nấu:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  "10 phút",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Exo'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
