import 'package:get/get.dart';
import 'package:getx_todo/data/repository/todo_repository.dart';
import 'package:getx_todo/model/todo.dart';

class FakeTodoRepository implements TodoRepository{
  var _storage = <Todo>[].obs;

  @override
  List<Todo> readTodos() {
    return _storage;
  }

  @override
  Future<void> writeTodos(List<Todo> todos) async =>
      _storage = todos.obs;
}
