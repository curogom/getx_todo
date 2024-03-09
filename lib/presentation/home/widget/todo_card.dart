import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/todo_controller.dart';
import 'package:getx_todo/model/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.todo,
    required this.index,
    required this.controller,
  });

  final Todo todo;
  final int index;
  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
        color: todo.status.color.shade50,
      ),
      child: ListTile(
        title: Text(todo.text),
        subtitle: Text(todo.status.name),
        contentPadding: const EdgeInsets.only(left: 16),
        trailing: _TodoActions(controller: controller, todo: todo, index: index),
      ),
    );
  }
}

class _TodoActions extends StatelessWidget {
  const _TodoActions({
    required this.controller,
    required this.todo,
    required this.index,
  });

  final TodoController controller;
  final Todo todo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (todo.status != TodoStatus.done)
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.play_arrow),
            onPressed: () => controller.goAhead(todo, index),
          ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.edit),
          onPressed: () => Get.toNamed(
            '/edit_todo',
            arguments: {'todo': todo, 'index': index},
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.delete),
          onPressed: () => controller.todos.removeAt(index),
        ),
      ],
    );
  }
}
