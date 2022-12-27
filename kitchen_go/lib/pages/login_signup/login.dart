import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Đăng nhập",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          width: 400,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập họ và tên";
                              } else if (value.length <= 5) {
                                return "Chưa đủ dộ dài tối thiểu";
                              }
                              // bool hasUppercase =
                              //     value.contains(new RegExp(r'[A-Z]'));
                              // bool hasDigits =
                              //     value.contains(new RegExp(r'[0-9]'));
                              // bool hasLowercase =
                              //     value.contains(new RegExp(r'[a-z]'));
                              // bool hasSpecialCharacters = value.contains(
                              //     new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
                              return null;
                            },
                            decoration: const InputDecoration(
                              //filled: true,
                              // fillColor: Color.fromARGB(255, 58, 58, 58),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              label: Text(
                                "Tên đăng nhập",
                                style: TextStyle(color: Colors.black),
                              ),
                              hintText: "Vui lòng nhập họ và tên",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 94, 92, 88)),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 400,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập mật khẩu";
                              } else if (value.length <= 5) {
                                return "Mật khẩu không đúng";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              // filled: true,
                              // fillColor: Color.fromARGB(255, 58, 58, 58),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              label: Text("Mật khẩu",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 94, 92, 88))),

                              hintText: "Vui lòng nhập mật khẩu",
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.lock, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 380,
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                height: 60,
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "Đăng nhập",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Exo'),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFFFA9700),
                                        Color(0xFF19FA6E),
                                      ]),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 15.0,
                                        offset: Offset(0.0,
                                            0.75) // changes position of shadow
                                        ),
                                  ],
                                ),
                              ),

                              // RecentlyViewed()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
