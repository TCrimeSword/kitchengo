import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(children: [buildQuetions(), buildAnswerList()]),
      )),
    );
  }

  buildQuetions() {}
  buildAnswerList() {}
  buildAnswerCard() {
    return Container(
      child: Text(''),
    );
  }
}
