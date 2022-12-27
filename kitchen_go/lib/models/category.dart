import 'package:kitchen_go/models/recipe.dart';

class Category {
  String id;
  String name;
  String? descriptions;
  String? image;
  List<dynamic>? listRecipes;
  Category(
      {required this.id,
      required this.name,
      this.descriptions,
      this.image,
      this.listRecipes});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (listRecipes != null) {
      data['recipes'] = listRecipes?.map((v) => v.toJson()).toList();
    }
    data['descriptions'] = descriptions;
    return data;
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      descriptions: json['descriptions'],
      image: json['image'],
      listRecipes:
          List.from(json['recipes']).map((e) => Recipe.fromJson(e)).toList(),
    );
  }
}
