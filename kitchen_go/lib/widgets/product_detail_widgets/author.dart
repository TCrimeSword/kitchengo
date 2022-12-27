import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Author extends StatelessWidget {
  const Author({super.key});

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
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Row(children: const [
                Text(
                  '30/11/2022',
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

    // return SingleChildScrollView(
    //   child: Column(
    //     children: [
          
    //     ],
    //   ),
    // );