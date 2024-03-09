import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo/data/repository/todo_repository.dart';

class StorageService extends GetxService {
  late GetStorage _storage;

  Future<StorageService> init({bool isTest = false}) async {
    if (!isTest) {
      _storage = GetStorage();
      await _storage.writeIfNull(todosKey, []);
    }

    return this;
  }

  T read<T>(String key) => _storage.read(key);

  Future<void> write(String key, dynamic value) async =>
      await _storage.write(key, value);
}
