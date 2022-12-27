import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DescriptioinFood extends StatelessWidget {
  const DescriptioinFood({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 380,
            child: const Padding(
              padding: EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo')),
            ),
          ),
        ],
      ),
    );
  }
}
