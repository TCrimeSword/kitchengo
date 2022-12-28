import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/api.dart';
import 'package:kitchen_go/models/blog.dart';

class MostViewed extends StatelessWidget {
  MostViewed({super.key, required this.listBlog});
  List<Blog> listBlog;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...listBlog.map((item) => Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      // height: 220,
                      // width: 381,
                      child: Image.network(
                        Api.getImageUrl(item.image),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      item.title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 56, 56, 56)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      Api.getImageUrl(item.author.avatar)),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item.author.username,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "30.000",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 56, 56, 56)),
                            ),
                            Icon(
                              Icons.remove_red_eye,
                              size: 20,
                            )
                          ],
                        ),
                        Text("19/11/2022")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
