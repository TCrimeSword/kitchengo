import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/widgets/layouts/layout.dart';

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
