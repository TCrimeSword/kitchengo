import 'package:kitchen_go/models/author.dart';
import 'package:kitchen_go/models/comment.dart';
import 'package:kitchen_go/models/ingredient.dart';

class Recipe {
  String id;
  String title;
  String? description;
  Author? author;
  String? image;
  List<dynamic>? ingredients;
  List<Comment>? comments;
  List<String>? steps;
  Recipe({
    required this.id,
    required this.title,
    this.description,
    this.author,
    this.ingredients,
    this.image,
    this.comments,
    this.steps,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['description'] = description;
    if (author != null) {
      data['author'] = author?.toJson();
    }
    if (ingredients != null) {
      data['ingredients'] = ingredients?.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments?.map((v) => v.toJson()).toList();
    }
    data['image'] = image;
    data['steps'] = steps;
    return data;
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      ingredients: List.from(json['ingredients'])
          .map((e) => Ingredient.fromJson(e))
          .toList(),
      comments:
          List.from(json['comments']).map((e) => Comment.fromJson(e)).toList(),
      image: json['image'],
      author: json['author'] != null ? Author.fromJson(json['author']) : null,
      steps: json['steps'].cast<String>(),
    );
  }
}
