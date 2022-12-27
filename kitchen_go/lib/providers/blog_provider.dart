import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kitchen_go/constants/api.dart';
import 'package:kitchen_go/models/blog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeProvider extends ChangeNotifier {
  List<Blog> listBlog = [];
  void init() async {}
  Future<List<Blog>> getList() async {
    var client = http.Client();
    var jsonRecipeStr = await client.get(Uri.parse(Api.url['BlogApi']!));
    var jsonRecipeObj = jsonDecode(jsonRecipeStr.body);
    var newListRecipeObj = jsonRecipeObj['data'] as List;
    listBlog = newListRecipeObj.map((e) => Blog.fromJson(e)).toList();
    notifyListeners();
    return listBlog;
  }

  Future<bool> addComment(String blogId, String content) async {
    final blog = listBlog.where((element) => element.id == blogId);
    if (blog.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');
      String? token = prefs.getString('token');
      if (userId == null && token == null) {
        return false;
      }
      var client = http.Client();
      var response = await client
          .post(Uri.parse(Api.getCommentUrl('blogs', blogId)), headers: {
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
