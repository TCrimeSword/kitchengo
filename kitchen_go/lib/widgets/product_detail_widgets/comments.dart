import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/api.dart';
import 'package:kitchen_go/models/comment.dart';

class Comments extends StatelessWidget {
  Comments({super.key, required this.listComment});
  List<Comment> listComment;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...listComment.map((e) => Column(
                children: [
                  Container(
                    // padding: EdgeInsets.only(left: 15, top: 5),
                    child: Row(
                      children: [
                        Image.network(
                          Api.getImageUrl(e.account!.avatar),
                          scale: 1.0,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                        ),
                        Text(
                          e.account!.username,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Exo'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 380,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 50, right: 10),
                      child: Text(e.content,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Exo')),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 5, left: 50),
                      child: Row(children: const [
                        Text(
                          '3 ngày trước',
                          style: TextStyle(
                              color: Color(0xFF363636),
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Exo-Italic'),
                        ),
                      ])),
                  SizedBox(
                    height: 16,
                  )
                ],
              )),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            // padding: EdgeInsets.only(left: 15, top: 5),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Ava03.png',
                  scale: 1.0,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  "Sơn Trần",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                )
              ],
            ),
          ),
          Container(
            width: 380,
            child: const Padding(
              padding: EdgeInsets.only(top: 5, left: 50, right: 10),
              child: Text(
                  'Tôi đã thử qua công thức này rồi :V nó ngon tuyệt 😍',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo')),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 5, left: 50),
              child: Row(children: const [
                Text(
                  '3 ngày trước',
                  style: TextStyle(
                      color: Color(0xFF363636),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Exo-Italic'),
                ),
              ])),
          Padding(padding: EdgeInsets.only(top: 10)),
          // Container(
          //   padding: EdgeInsets.only(left: 15, top: 5),
          //   child: Row(
          //     children: [
          //       Image.asset(
          //         'assets/images/Ava03.png',
          //         scale: 1.0,
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(right: 5),
          //       ),
          //       Text(
          //         "Đạt Dưương",
          //         style: TextStyle(
          //             fontSize: 18,
          //             fontWeight: FontWeight.w500,
          //             fontFamily: 'Exo'),
          //       )
          //     ],
          //   ),
          // ),
          // Container(
          //   width: 380,
          //   child: const Padding(
          //     padding: EdgeInsets.only(top: 5, left: 30, right: 10),
          //     child: Text(
          //         'Dù không biết nấu ăn nhưng cũng tưởng tượng ra được nó khó nấu đấy',
          //         textAlign: TextAlign.justify,
          //         style: TextStyle(
          //             fontSize: 16,
          //             fontStyle: FontStyle.italic,
          //             fontWeight: FontWeight.w500,
          //             fontFamily: 'Exo')),
          //   ),
          // ),
          // Container(
          //     padding: EdgeInsets.only(top: 5, left: 30),
          //     child: Row(children: const [
          //       Text(
          //         '3 ngày trước',
          //         style: TextStyle(
          //             color: Color(0xFF363636),
          //             fontSize: 16,
          //             fontStyle: FontStyle.italic,
          //             fontWeight: FontWeight.w400,
          //             fontFamily: 'Exo-Italic'),
          //       ),
          //     ])),
        ],
      ),
    );
  }
}
