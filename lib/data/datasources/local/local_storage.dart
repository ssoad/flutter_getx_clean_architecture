

import '../../../core/services/local_storage_service.dart';

class LocalStorage {
  final LocalStorageService localStorageService;

  LocalStorage({required this.localStorageService});

  

  Future<void> saveData(String key, dynamic data) async {
    await localStorageService.saveData(key, data);
  }

  Future<dynamic> getData(String key) async {
    return await localStorageService.getData(key);
  }
}
