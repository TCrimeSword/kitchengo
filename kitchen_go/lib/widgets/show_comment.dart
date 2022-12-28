import 'package:flutter/material.dart';

class ShowComment extends StatelessWidget {
  const ShowComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bình luận"),
        backgroundColor: Colors.orange,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/img.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Đạt Dương",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )),
            Row(
              children: [
                SizedBox(
                  width: 301,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Bình luận của bạn...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 22,
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
