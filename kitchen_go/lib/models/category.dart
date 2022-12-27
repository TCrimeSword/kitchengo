class Category {
  String id;
  String name;
  String? description;
  String? image;
  Category(
      {required this.id, required this.name, this.description, this.image});
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
      };

  factory Category.fromJson(Map<String, dynamic> obj) {
    return Category(
      id: obj['id'],
      name: obj['name'],
      description: obj['description'],
      image: obj['image'],
    );
  }
}
