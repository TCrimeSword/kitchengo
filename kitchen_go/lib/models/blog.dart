import 'package:kitchen_go/models/author.dart';
import 'package:kitchen_go/models/comment.dart';

class Blog {
  Blog({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.comments,
    required this.image,
  });
  late final String id;
  late final String title;
  late final String content;
  late final Author author;
  late final List<Comment> comments;
  late final String image;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['author'] = author.toJson();
    data['comments'] = comments.map((e) => e.toJson()).toList();
    data['image'] = image;
    return data;
  }

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['_id'],
      title: json['title'],
      author: Author.fromJson(json['author']),
      content: json['content'],
      comments:
          List.from(json['comments']).map((e) => Comment.fromJson(e)).toList(),
      image: json['image'],
    );
  }
}
