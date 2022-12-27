import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kitchen_go/constants/api.dart';
import 'package:kitchen_go/models/category.dart';
import 'package:kitchen_go/models/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> listRecipe = [];
  List<Category> listCategory = [];
  void init() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', '63783ad436f0e4df22be9dcd');
    prefs.setString('token',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2NvdW50SWQiOiI2Mzc4M2FkNDM2ZjBlNGRmMjJiZTlkY2QiLCJpYXQiOjE2NzIxMDE0NDEsImV4cCI6MTY3MjE0NDY0MX0.mB2gr9po3QAzdgO-CxyiSVVi7GgRVewlmw_f3OVrP8o');
    await getList();
    await getListCategory();
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
}
