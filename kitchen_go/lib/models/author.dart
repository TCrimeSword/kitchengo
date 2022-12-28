class Author {
  String id;
  String username;
  String email;
  String avatar;

  Author({
    required this.id,
    required this.username,
    required this.email,
    required this.avatar,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
        id: json['_id'],
        username: json['username'],
        email: json['email'],
        avatar: json['avatar']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['avatar'] = avatar;
    return data;
  }
}
