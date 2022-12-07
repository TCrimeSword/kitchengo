import 'package:flutter/material.dart';
import 'package:kitchen_go/pages/question.dart';
import 'package:rive/rive.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    Curves.easeIn;
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const QuestionPage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: RiveAnimation.asset('animations/fianl2.riv')),
    );
  }
}
