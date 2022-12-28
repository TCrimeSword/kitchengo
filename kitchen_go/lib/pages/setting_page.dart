import 'package:flutter/material.dart';
import 'package:kitchen_go/pages/login.dart';
import 'package:kitchen_go/pages/user_info_page.dart';
import 'package:kitchen_go/providers/account_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Cài đặt",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 20),
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => UserInfoPage()));
                },
                child: Text(
                  "Thông tin cá nhân",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      content: Text("Bạn có muốn đăng xuất không?"),
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Trở lại"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Đăng xuất",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ]),
                );
              },
              child: InkWell(
                onTap: () {
                  Provider.of<AccountProvider>(context, listen: false).logout();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => Login()));
                },
                child: Container(
                  width: 381,
                  height: 59,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    "Đăng xuất",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
