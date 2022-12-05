import 'package:flutter/material.dart';
import 'package:kitchen_go/widgets/layouts/bottom_nav.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    required this.bgColor,
    this.title,
    required this.child,
    required this.selectedIndex,
  });
  final Color bgColor;
  final String? title;
  final Widget child;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
        backgroundColor: bgColor,
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigation(selectedIndex: selectedIndex),
    );
  }
}
