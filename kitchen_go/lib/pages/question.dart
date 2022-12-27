import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/route_name.dart';

import 'package:rive/rive.dart' as rive;

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int isSelected = -1;
  bool isAnswer = false;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              const rive.RiveAnimation.asset(
                "assets/animations/question.riv",
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 35),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          isAnswer
                              ? InkWell(
                                  onTap: (() {
                                    setState(() {
                                      isAnswer = false;
                                      isSelected = -1;
                                    });
                                  }),
                                  child: Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Icon(
                                        Icons.navigate_before,
                                        size: 36,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105),
                                      ),
                                      const Text(
                                        "Quay lại",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 105, 105, 105)),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          InkWell(
                            onTap: (() {
                              Navigator.pushReplacementNamed(
                                  context, RouteName.homeScreen);
                            }),
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Bỏ qua",
                                  style: TextStyle(
                                      fontSize: 18,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Color.fromARGB(255, 105, 105, 105)),
                                ),
                                const Icon(
                                  Icons.navigate_next,
                                  size: 36,
                                  color: Color.fromARGB(255, 105, 105, 105),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Image.asset("assets/images/logo.png"),
                      const SizedBox(
                        height: 127.2,
                      ),
                      Text(
                        (!isAnswer)
                            ? "Bạn đã từng nấu ăn trước đó chưa?"
                            : "Bạn có ăn chay không?",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 105, 105, 105),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            isSelected = 0;
                          });
                        }),
                        child: Container(
                          height: 70,
                          width: 323,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: (isSelected == 0
                                  ? const Color.fromARGB(255, 32, 187, 91)
                                  : Colors.transparent),
                              width: 2.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: const Offset(
                                    0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          // ignore: prefer_const_constructors
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              !isAnswer
                                  ? "Yeah, tôi từng nấu ăn trước đó rồi"
                                  : "Yeah, tôi là người ăn chay",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: (isSelected == 0)
                                    ? const Color.fromARGB(255, 32, 187, 91)
                                    : const Color.fromARGB(255, 105, 105, 105),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            isSelected = 1;
                          });
                        }),
                        child: Container(
                          height: 70,
                          width: 323,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: (isSelected == 1
                                  ? const Color.fromARGB(255, 252, 129, 0)
                                  : Colors.transparent),
                              width: 2.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: const Offset(
                                    0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          // ignore: prefer_const_constructors
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              !isAnswer
                                  ? "Nah, đây là lần đầu tiên của tôi"
                                  : "Tôi không ăn chay",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: (isSelected == 1)
                                    ? const Color.fromARGB(255, 252, 129, 0)
                                    : const Color.fromARGB(255, 105, 105, 105),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            if (!isAnswer) {
                              isAnswer = true;
                              isSelected = -1;
                            } else {
                              isDone = true;
                            }
                          });
                        }),
                        child: Container(
                          height: 59,
                          width: 323,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: [
                                0.35,
                                0.8,
                              ],
                              colors: [
                                Color.fromARGB(255, 252, 129, 0),
                                Color.fromARGB(255, 25, 250, 110)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(27.5),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: const Offset(
                                    0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          // ignore: prefer_const_constructors
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              !isAnswer ? "Tiếp theo" : "Hoàn thành",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
