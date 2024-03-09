import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/todo_controller.dart';
import 'package:getx_todo/model/todo.dart';

class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCtl = Get.find<TodoController>();
    Map<String, Object?>? args = Get.arguments;
    Todo? todo = args?['todo'] as Todo?;
    int? index = args?['index'] as int?;
    bool isEdit = todo != null;
    final subTitle = isEdit ? 'Edit Task' : 'New Task';
    final title = 'Todo - $subTitle';
    final buttonText = isEdit ? 'Edit Task' : 'Save New Task';
    final todoTextController = TextEditingController(text: todo?.text);
    final formKey = GlobalKey<FormState>();
    const todoStatuses = TodoStatus.values;
    TodoStatus selectStatus = todo?.status ?? TodoStatus.todo;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: DropdownButtonFormField(
                    value: selectStatus,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      labelText: 'Todo Status',
                    ),
                    items: List.generate(
                      todoStatuses.length,
                      (index) => DropdownMenuItem<TodoStatus>(
                        value: todoStatuses[index],
                        child: Text(todoStatuses[index].name),
                      ),
                    ),
                    onChanged: (value) => selectStatus = value!,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return 'Please enter a task description.';
                        }
                        return null;
                      },
                      controller: todoTextController,
                      decoration: const InputDecoration(
                        labelText: 'What to do?',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                      minLines: 30,
                      maxLines: 30,
                    ),
                  ),
                ),
              ),
              FilledButton(
                child: Text(buttonText),
                onPressed: () {
                  final isValid = formKey.currentState?.validate() ?? false;

                  if (isValid) {
                    final todo = Todo(
                      text: todoTextController.text,
                      status: selectStatus,
                    );

                    if (isEdit) {
                      todoCtl.editTodo(todo, index!);
                    } else {
                      todoCtl.addTodo(todo);
                    }
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
