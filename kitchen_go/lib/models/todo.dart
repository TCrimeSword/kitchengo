import 'package:kitchen_go/models/ingredient.dart';

class Todo {
  bool isDone;
  Ingredient ingredient;
  Todo({required this.isDone, required this.ingredient});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isDone'] = isDone;
    data['ingredient'] = ingredient.toJson();
    return data;
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        isDone: json['isDone'],
        ingredient: Ingredient.fromJson(json['ingredient']));
  }
}
