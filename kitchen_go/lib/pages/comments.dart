import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kitchen_go/constants/colors.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        //shadowColor: Color.fromARGB(255, 22, 58, 143),
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 68),
          child: Column(
            children: const [
              Text(
                "Bình luận",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
            ],
          ),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            ColorConstant.BlueMediumColor,
            ColorConstant.BlueBoldColor
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {},
          iconSize: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [Comments(), Comments()],
                ),
              ),
            )),
            Row(
              children: [
                Container(
                  width: 305,
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: "Bình luận của bạn...",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.send))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
