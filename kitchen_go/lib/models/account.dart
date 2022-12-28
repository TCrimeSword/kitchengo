class Account {
  String id;
  String username;
  String password;
  String? avatar;
  Account(
      {required this.id,
      required this.username,
      required this.password,
      this.avatar});
  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
        'avatar': avatar,
      };

  factory Account.fromJson(Map<String, dynamic> obj) {
    return Account(
      id: obj['id'],
      username: obj['username'],
      password: obj['password'],
      avatar: obj['avatar'],
    );
  }
}
