import 'package:flutter/material.dart';
import 'package:mobile_chickengo_husc/constants/route_name.dart';
import 'package:mobile_chickengo_husc/widgets/layouts/layout.dart';

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
        child: Container(child: Text('User ')),
        selectedIndex: RouteName.userScreenIndex);
  }
}