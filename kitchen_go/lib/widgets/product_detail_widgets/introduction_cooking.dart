import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class IntroductionCooking extends StatelessWidget {
  IntroductionCooking({super.key, required this.steps});
  List<String> steps;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < steps.length; i++)
            Column(
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Bước ${i + 1} ',
                      style: const TextStyle(
                          color: ColorConstant.BlueBoldColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Exo'),
                      children: <TextSpan>[
                        TextSpan(
                          text: steps[i],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Exo'),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            )
        ],
      ),
    );
  }
}
