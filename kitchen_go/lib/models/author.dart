class Author {
  String id;
  String username;
  String email;

  Author({
    required this.id,
    required this.username,
    required this.email,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
        id: json['_id'], username: json['username'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}
