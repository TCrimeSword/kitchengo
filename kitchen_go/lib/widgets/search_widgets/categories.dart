import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/colors.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Row(children: [
                Text(
                  'Thể loại',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Exo'),
                ),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios), onPressed: () {})
              ])),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(5, 10, 10, 0)),
                      Stack(
                        children: [
                          Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset(
                                        'assets/images/cate01.png',
                                        fit: BoxFit.fitHeight,
                                        scale: 1.01,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 65),
                            child: Container(
                                padding: EdgeInsets.only(top: 10),
                                height: 43,
                                width: 181,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromARGB(255, 0, 0, 0),
                                          Color.fromARGB(255, 0, 0, 0)
                                        ]),
                                    color: ColorConstant.BlueMediumColor
                                        .withOpacity(0.5)),
                                child: const Text(
                                  'Món gà',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Exo'),
                                )),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset(
                                        'assets/images/cate01.png',
                                        fit: BoxFit.fitHeight,
                                        scale: 1.01,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 65),
                            child: Container(
                                padding: EdgeInsets.only(top: 10),
                                height: 43,
                                width: 181,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromARGB(255, 0, 0, 0),
                                          Color.fromARGB(255, 0, 0, 0)
                                        ]),
                                    color: ColorConstant.BlueMediumColor
                                        .withOpacity(0.5)),
                                child: const Text(
                                  'Món gà',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Exo'),
                                )),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset(
                                        'assets/images/cate01.png',
                                        fit: BoxFit.fitHeight,
                                        scale: 1.01,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 65),
                            child: Container(
                                padding: EdgeInsets.only(top: 10),
                                height: 43,
                                width: 181,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromARGB(255, 0, 0, 0),
                                          Color.fromARGB(255, 0, 0, 0)
                                        ]),
                                    color: ColorConstant.BlueMediumColor
                                        .withOpacity(0.5)),
                                child: const Text(
                                  'Món gà',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Exo'),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
