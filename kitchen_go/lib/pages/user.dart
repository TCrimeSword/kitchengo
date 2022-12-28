import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/pages/login.dart';
import 'package:kitchen_go/pages/setting_page.dart';
import 'package:kitchen_go/providers/account_provider.dart';
import 'package:kitchen_go/widgets/layouts/layout.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        bgColor: Colors.pinkAccent,
        selectedIndex: RouteName.userScreenIndex,
        title: 'Trang cá nhân',
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => SettingPage()));
            },
          ),
        ],
        child: Consumer<AccountProvider>(builder: (context, data, _) {
          return data.isLogin
              ? Container(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
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
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Tuấn Trần",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 75,
                        ),
                        Text("Yêu thích"),
                        Divider(
                          color: Colors.pink,
                          thickness: 5,
                        ),
                        SizedBox(
                          width: 381,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Container(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => Login()));
                        },
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                );
        }));
  }
}
