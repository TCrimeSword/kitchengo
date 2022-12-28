import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kitchen_go/constants/api.dart';
import 'package:kitchen_go/models/category.dart';
import 'package:kitchen_go/models/ingredient.dart';
import 'package:kitchen_go/models/recipe.dart';
import 'package:kitchen_go/models/todo.dart';
import 'package:kitchen_go/storages/todo_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> listRecipe = [];
  List<Category> listCategory = [];
  List<Todo> listTodo = [];
  TodoStorage todoStorage = TodoStorage();
  void init() async {
    await getList();
    await getListCategory();
    getTodoList();
  }

  Future<List<Recipe>> getList() async {
    var client = http.Client();
    var jsonRecipeStr = await client.get(Uri.parse(Api.url['RecipeApi']!));
    var jsonRecipeObj = jsonDecode(jsonRecipeStr.body);
    var newListRecipeObj = jsonRecipeObj['data'] as List;
    listRecipe = newListRecipeObj.map((e) => Recipe.fromJson(e)).toList();
    notifyListeners();
    return listRecipe;
  }

  Future<List<Category>> getListCategory() async {
    var client = http.Client();
    var jsonCategoryStr = await client.get(Uri.parse(Api.url['CategoryApi']!));
    var jsonCategoryObj = jsonDecode(jsonCategoryStr.body);
    var newListCategoryObj = jsonCategoryObj['data'] as List;
    listCategory = newListCategoryObj.map((e) => Category.fromJson(e)).toList();
    notifyListeners();
    return listCategory;
  }

  void getListSearch(String searchValue) async {
    notifyListeners();
  }

  void getDetail(id) async {
    notifyListeners();
  }

  Future<List<Recipe>> getRecipeInCategory(int categoryId) async {
    return listRecipe;
  }

  Future<bool> addComment(String recipeId, String content) async {
    final recipe = listRecipe.where((element) => element.id == recipeId);
    if (recipe.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');
      String? token = prefs.getString('token');
      if (userId == null && token == null) {
        return false;
      }
      var client = http.Client();
      var response = await client
          .post(Uri.parse(Api.getCommentUrl('recipes', recipeId)), headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }, body: {
        'accountId': userId,
        'content': content
      });
      final responseJson = jsonDecode(response.body);
      if (responseJson['success']) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void getTodoList() async {
    listTodo = await todoStorage.read();
  }

  void addToDoList(List<Ingredient> listIngredient) async {
    listTodo = [];
    for (int i = 0; i < listIngredient.length; i++) {
      listTodo.add(Todo(isDone: false, ingredient: listIngredient[i]));
    }
    notifyListeners();
    todoStorage.write(listTodo);
  }

  void checkDoneTodo(String todoName) async {
    for (int i = 0; i < listTodo.length; i++) {
      if (listTodo[i].ingredient.name == todoName) {
        listTodo[i].isDone = !listTodo[i].isDone;
        break;
      }
    }
    notifyListeners();
    todoStorage.write(listTodo);
  }
}
