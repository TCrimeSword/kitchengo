import 'package:flutter/material.dart';

class EditInfo extends StatelessWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 90,
        title: Text(
          "Thông tin cá nhân",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
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
                  width: 15,
                ),
                SizedBox(
                  width: 219,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Tuấn Trần",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
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
                  width: 23,
                ),
                Icon(Icons.check_circle),
                Text("Nam"),
                SizedBox(
                  width: 22,
                ),
                Icon(Icons.circle_outlined),
                Text("Nữ"),
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
                  width: 15,
                ),
                SizedBox(
                  width: 189,
                  height: 49,
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
