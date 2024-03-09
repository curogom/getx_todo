import 'package:get/get.dart';
import 'package:getx_todo/data/repository/todo_repository.dart';
import 'package:getx_todo/model/todo.dart';

class TodoController extends GetxController {
  final TodoRepository todoRepository;

  TodoController({required this.todoRepository});

  final todos = <Todo>[].obs;


  @override
  void onInit() {
    super.onInit();
    todos.assignAll(todoRepository.readTodos());
    ever(todos, (_) => todoRepository.writeTodos(todos));
  }

  void addTodo(Todo todo) {
    if (todos.contains(todo)) {
      return;
    } else {
      todos.add(todo);
      return;
    }
  }

  void editTodo(Todo todo, int index) {
    todos[index] = todo;
  }

  void goAhead(Todo todo, int index) {
    final newStatus = TodoStatus.values[todo.status.index + 1];
    final newTodo = todo.copyWith(status: newStatus);
    editTodo(newTodo, index);
  }
}