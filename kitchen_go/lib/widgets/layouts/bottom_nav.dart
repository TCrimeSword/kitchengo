import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/global_variable.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      Navigator.pushReplacementNamed(context, GlobalVariable.routes[index]);
    }

    return SalomonBottomBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.explore_outlined),
          title: const Text("Khám phá"),
          selectedColor: Colors.blue,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(Icons.article_outlined),
          title: const Text("Bản tin"),
          selectedColor: Colors.orange,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: const Icon(Icons.list),
          title: const Text("Danh sách"),
          selectedColor: Colors.green,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(Icons.person_outline),
          title: const Text("Tài khoản"),
          selectedColor: Colors.pinkAccent,
        ),
      ],
    );
  }
}
