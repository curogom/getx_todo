import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_todo/data/repository/todo_repository.dart';
import 'package:getx_todo/data/service/storage_service.dart';
import 'package:getx_todo/model/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  final _storage = Get.find<StorageService>();

  @override
  List<Todo> readTodos() {
    List<Todo> todos = [];

    final storageData = _storage.read(todosKey);

    if (storageData.isEmpty) {
      return todos;
    }

    jsonDecode(_storage.read(todosKey)).forEach((todo) {
      todos.add(Todo.fromJson(todo));
    });

    return todos;
  }

  @override
  Future<void> writeTodos(List<Todo> todos) async =>
      await _storage.write(todosKey, jsonEncode(todos));
}
