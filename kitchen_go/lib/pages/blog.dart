import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/widgets/layouts/layout.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        bgColor: Colors.orange,
        child: Container(child: Text('Bản tin')),
        selectedIndex: RouteName.blogScreenIndex);
  }
}
