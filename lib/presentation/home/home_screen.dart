import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/todo_controller.dart';
import 'package:getx_todo/presentation/home/widget/todo_card.dart';

class HomeScreen extends GetView<TodoController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo - Home')),
      body: Obx(
        () {
          if (controller.todos.isEmpty) {
            return const Center(
              child: Text('No Todos'),
            );
          }

          return ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }

              final todo = controller.todos.removeAt(oldIndex);
              controller.todos.insert(newIndex, todo);
            },
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final todo = controller.todos[index];
              return TodoCard(
                key: ValueKey(todo),
                todo: todo,
                index: index,
                controller: controller,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/edit_todo'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
