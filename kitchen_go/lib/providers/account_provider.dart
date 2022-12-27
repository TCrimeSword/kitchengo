import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kitchen_go/constants/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountProvider extends ChangeNotifier {
  String usernameSave = '';
  String passwordSave = '';
  Future<bool> login(String username, String password) async {
    var client = http.Client();
    var response = await client.post(Uri.parse(Api.url['LoginApi']!),
        body: {'username': username, 'password': password});
    final responseJson = jsonDecode(response.body);
    if (responseJson['success']) {
      final prefs = await SharedPreferences.getInstance();
      usernameSave = username;
      passwordSave = password;
      prefs.setString('userId', responseJson['data']['userId']);
      prefs.setString('token', responseJson['data']['accessToken']);
      prefs.setString('refreshToken', responseJson['data']['refreshToken']);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> logout() async {
    var client = http.Client();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    var response = await client.get(
      Uri.parse(Api.url['LogoutApi']!),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    final responseJson = jsonDecode(response.body);
    if (responseJson['success']) {
      prefs.remove('username');
      prefs.remove('userId');
      prefs.remove('token');
      prefs.remove('refreshToken');
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(String username, String password, String email) async {
    var client = http.Client();
    var response = await client.post(Uri.parse(Api.url['RegisterApi']!),
        body: {'username': username, 'password': password, 'email': email});
    final responseJson = jsonDecode(response.body);
    if (responseJson['success']) {
      usernameSave = username;
      passwordSave = password;
      return true;
    } else {
      return false;
    }
  }
}
