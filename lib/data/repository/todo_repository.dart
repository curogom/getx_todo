import 'package:getx_todo/model/todo.dart';

const todosKey = 'todos';

abstract class TodoRepository {
  List<Todo> readTodos();
  Future<void> writeTodos(List<Todo> todos);
}
