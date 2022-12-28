import 'package:kitchen_go/models/author.dart';

class Comment {
  String id;
  Author? account;
  String content;
  Comment({
    required this.id,
    this.account,
    required this.content,
  });
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      account:
          json['account'] != null ? Author.fromJson(json['account']) : null,
      content: json['content'],
      id: json['_id'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['content'] = content;
    data['_id'] = id;
    return data;
  }
}
