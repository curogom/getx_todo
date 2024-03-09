import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo/binding/fake_todo_binding.dart';
import 'package:getx_todo/binding/todo_binding.dart';
import 'package:getx_todo/data/service/storage_service.dart';
import 'package:getx_todo/presentation/editor/editor_screen.dart';
import 'package:getx_todo/presentation/home/home_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  final bool isTest;

  const TodoApp({super.key, this.isTest = false});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: isTest ? FakeTodoBinding() : TodoBinding(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/edit_todo', page: () => const EditorScreen()),
      ],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(shadowColor: Colors.grey, elevation: 1),
      ),
    );
  }
}
