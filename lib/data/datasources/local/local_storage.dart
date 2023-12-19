

import '../../../core/services/local_storage_service.dart';

class LocalStorage {
  final LocalStorageService _localStorageService;

  LocalStorage(this._localStorageService);

  Future<void> saveData(String key, dynamic data) async {
    await _localStorageService.saveData(key, data);
  }

  Future<dynamic> getData(String key) async {
    return await _localStorageService.getData(key);
  }
}
