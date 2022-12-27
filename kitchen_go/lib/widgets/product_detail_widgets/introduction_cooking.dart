import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class IntroductionCooking extends StatelessWidget {
  const IntroductionCooking({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RichText(
            text: const TextSpan(
                text: 'Bước 1',
                style: TextStyle(
                    color: ColorConstant.BlueBoldColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Exo'),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        ' Đầu tiên, chúng ta làm sạch thịt, cắt phần xương rồi khía những rãnh bằng nhau trên mặt miếng thịt.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Exo'),
                  ),
                ]),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          RichText(
            text: const TextSpan(
                text: 'Bước 1',
                style: TextStyle(
                    color: ColorConstant.BlueBoldColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Exo'),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        ' Đầu tiên, chúng ta làm sạch thịt, cắt phần xương rồi khía những rãnh bằng nhau trên mặt miếng thịt.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Exo'),
                  ),
                ]),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          RichText(
            text: const TextSpan(
                text: 'Bước 1',
                style: TextStyle(
                    color: ColorConstant.BlueBoldColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Exo'),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        ' Đầu tiên, chúng ta làm sạch thịt, cắt phần xương rồi khía những rãnh bằng nhau trên mặt miếng thịt.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Exo'),
                  ),
                ]),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          RichText(
            text: const TextSpan(
                text: 'Bước 1',
                style: TextStyle(
                    color: ColorConstant.BlueBoldColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Exo'),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        ' Đầu tiên, chúng ta làm sạch thịt, cắt phần xương rồi khía những rãnh bằng nhau trên mặt miếng thịt.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Exo'),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
