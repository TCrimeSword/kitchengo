import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/colors.dart';

class Errors extends StatelessWidget {
  const Errors({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: 350,
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Column(children: [
                RichText(
                  text: const TextSpan(
                      text: 'không tìm thấy kết quả ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Exo'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '"Thịt chó"',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Exo'),
                        ),
                      ]),
                )
              ])),
        ],
      ),
    );
  }
}
