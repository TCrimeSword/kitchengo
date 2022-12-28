import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kitchen_go/constants/api.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/models/blog.dart';
import 'package:kitchen_go/widgets/layouts/layout.dart';
import 'package:kitchen_go/widgets/show_comment.dart';

class ShowBlog extends StatelessWidget {
  ShowBlog({super.key, required this.blog});
  Blog blog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 15, right: 15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 381,
                  height: 220,
                  child: Image.network(
                    Api.getImageUrl(blog.image),
                    width: 381,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage(Api.getImageUrl(blog.author.avatar)),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      blog.author.username,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "18/11/2022",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Html(data: blog.content),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "Bình luận:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                      hintText: "Bình luận của bạn...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                ...blog.comments.map((item) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      Api.getImageUrl(item.account!.avatar)),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item.account!.username,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(
                            item.content,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(
                            "3 ngày trước",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
