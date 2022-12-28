import 'package:flutter/material.dart';
import 'package:kitchen_go/pages/edit_user_info.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Thông tin cá nhân",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => EditInfo()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 30),
                height: 159,
                width: 159,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Ava01.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text("Tên người dùng"),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Tuấn Trần")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text("Giới tính"),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Nam"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text("Ngày sinh"),
                  SizedBox(
                    width: 5,
                  ),
                  Text("1/1/1999"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
