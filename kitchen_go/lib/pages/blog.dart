import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/providers/blog_provider.dart';
import 'package:kitchen_go/widgets/lasted_blog.dart';
import 'package:kitchen_go/widgets/layouts/layout.dart';
import 'package:kitchen_go/widgets/most_view.dart';
import 'package:provider/provider.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

enum _MenuValue { page1, page2 }

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlogProvider>(builder: (context, data, _) {
      return Layout(
        bgColor: Colors.orange,
        title: 'Bản tin',
        selectedIndex: RouteName.blogScreenIndex,
        actions: [
          PopupMenuButton<_MenuValue>(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text('Mới nhất'),
                value: _MenuValue.page1,
              ),
              PopupMenuItem(
                child: Text('Xem nhiều nhất'),
                value: _MenuValue.page2,
              )
            ],
            onSelected: (value) {
              switch (value) {
                case _MenuValue.page2:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => MostViewed(
                            listBlog: data.listBlog,
                          )));
                  break;
                case _MenuValue.page1:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => LastestBlog(
                            listBlog: data.listBlog,
                          )));
                  break;
              }
            },
          )
        ],
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: LastestBlog(listBlog: data.listBlog)),
              ],
            ),
          ],
        ),
      );
    });
  }
}
