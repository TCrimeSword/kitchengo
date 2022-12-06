
import 'package:flutter/material.dart';
import 'package:mobile_chickengo_husc/widgets/layouts/layout.dart';

import '../../constants/route_name.dart';

class BlogPage extends StatefulWidget {
 // const BlogPage({super.key});

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
