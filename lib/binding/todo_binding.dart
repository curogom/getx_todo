import 'package:get/get.dart';
import 'package:getx_todo/controller/todo_controller.dart';
import 'package:getx_todo/data/repository/todo_repository_impl.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(
      () => TodoController(todoRepository: TodoRepositoryImpl()),
    );
  }
}
