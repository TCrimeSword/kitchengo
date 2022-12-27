import 'package:kitchen_go/models/comment.dart';
import 'package:kitchen_go/models/ingredient.dart';

class Recipe {
  String id;
  String title;
  String? description;
  List<dynamic>? images;
  List<dynamic>? ingredients;
  List<dynamic>? comments;
  Recipe({
    required this.id,
    required this.title,
    this.description,
    this.ingredients,
    this.images,
    this.comments,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'ingredients': ingredients,
        'comments': comments,
        'images': images,
      };

  factory Recipe.fromJson(Map<String, dynamic> obj) {
    return Recipe(
      id: obj['_id'],
      title: obj['title'],
      description: obj['description'],
      ingredients: obj['ingredients'],
      comments: obj['comments'],
      images: obj['images'],
    );
  }
}
