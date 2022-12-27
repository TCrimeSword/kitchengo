import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, top: 5),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Ava01.png',
                  scale: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  "Tuấn Trần",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                )
              ],
            ),
          ),
          Container(
            width: 380,
            child: const Padding(
              padding: EdgeInsets.only(top: 5, left: 30, right: 10),
              child: Text(
                  'Tôi đã thử qua công thức này rồi :V nó ngon tuyệt 😍',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo')),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 5, left: 30),
              child: Row(children: const [
                Text(
                  '3 ngày trước',
                  style: TextStyle(
                      color: Color(0xFF363636),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Exo-Italic'),
                ),
              ])),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            padding: EdgeInsets.only(left: 15, top: 5),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Ava02.png',
                  scale: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  "Sơn Trần",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                )
              ],
            ),
          ),
          Container(
            width: 380,
            child: const Padding(
              padding: EdgeInsets.only(top: 5, left: 30, right: 10),
              child: Text(
                  'Tôi đã thử qua công thức này rồi :V nó ngon tuyệt 😍',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo')),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 5, left: 30),
              child: Row(children: const [
                Text(
                  '3 ngày trước',
                  style: TextStyle(
                      color: Color(0xFF363636),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Exo-Italic'),
                ),
              ])),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            padding: EdgeInsets.only(left: 15, top: 5),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Ava03.png',
                  scale: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  "Đạt Dưương",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                )
              ],
            ),
          ),
          Container(
            width: 380,
            child: const Padding(
              padding: EdgeInsets.only(top: 5, left: 30, right: 10),
              child: Text(
                  'Dù không biết nấu ăn nhưng cũng tưởng tượng ra được nó khó nấu đấy',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo')),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 5, left: 30),
              child: Row(children: const [
                Text(
                  '3 ngày trước',
                  style: TextStyle(
                      color: Color(0xFF363636),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Exo-Italic'),
                ),
              ])),
        ],
      ),
    );
  }
}
