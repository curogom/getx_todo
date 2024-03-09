import 'package:get/get.dart';
import 'package:getx_todo/controller/todo_controller.dart';
import 'package:getx_todo/data/repository/fake_todo_repository.dart';

class FakeTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(
      () => TodoController(todoRepository: FakeTodoRepository()),
    );
  }
}
