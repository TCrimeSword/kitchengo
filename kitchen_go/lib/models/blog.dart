import 'package:kitchen_go/models/comment.dart';

class Blog {
  String id;
  String accountId;
  String content;
  String title;
  List<Comment>? comments;
  Blog(
      {required this.id,
      required this.accountId,
      required this.content,
      required this.title,
      this.comments});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'accountId': accountId,
        'comments': comments,
      };

  factory Blog.fromJson(Map<String, dynamic> obj) {
    return Blog(
      id: obj['id'],
      title: obj['title'],
      accountId: obj['accountId'],
      content: obj['content'],
      comments: obj['comments'],
    );
  }
}
