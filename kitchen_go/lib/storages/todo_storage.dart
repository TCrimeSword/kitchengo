import 'dart:convert';
import 'dart:io';

import 'package:kitchen_go/models/todo.dart';
import 'package:path_provider/path_provider.dart';

class TodoStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/todo.json');
  }

  Future<File> write(List<Todo> list) async {
    final file = await _localFile;

    // Write the file
    String json = jsonEncode(list);
    return file.writeAsString(json);
  }

  Future<List<Todo>> read() async {
    try {
      List<Todo> list = [];
      final file = await _localFile;
      // if (file.exists())
      // Read the file
      final str = await file.readAsString();
      if (str.isNotEmpty) {
        var jsonObject = jsonDecode(str);
        var newListObject = jsonObject as List;
        list = newListObject.map((e) {
          return Todo.fromJson(e);
        }).toList();
      }
      return list;
    } catch (e) {
      // If encountering an error, return 0
      return [];
    }
  }
}
