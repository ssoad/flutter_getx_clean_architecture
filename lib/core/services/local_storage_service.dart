import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../domain/entities/user.dart';

enum _Key { user, apitoken, locale }

class LocalStorageService extends GetxService {
  bool get isLoggedIn => user.obs != null.obs;
  Rx<User> get currentUser => user!.obs;
  RxString get currentToken => apiToken!.obs;
  GetStorage? _getStorage;
  // RxString get FirebaseToken => "".obs;
  // FirebaseMessaging? messaging;

  LocalStorageService() {
    init();
  }

  Future<LocalStorageService> init() async {
    _getStorage = GetStorage();
    // messaging = FirebaseMessaging.instance;
    // messaging!.getToken().then((value) =>
    //     _sharedPreferences!.setString('firebaseDeviceToken', value!));
    return this;
  }

  String? get apiToken {
    return _getStorage?.read(_Key.apitoken.toString());
  }

  set apiToken(String? value) {
    if (value != null) {
      _getStorage?.write(_Key.apitoken.toString(), value);
    } else {
      _getStorage?.remove(_Key.apitoken.toString());
    }
  }

  User? get user {
    final rawJson = _getStorage?.read(_Key.user.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return User.fromJson(map);
  }

  set user(User? value) {
    if (value != null) {
      _getStorage?.write(_Key.user.toString(), json.encode(value.toJson()));
    } else {
      _getStorage?.remove(_Key.user.toString());
    }
  }

  // set firebaseDeviceToken(String? value) {
  //   if (value != null) {
  //     _sharedPreferences?.setString('firebaseDeviceToken', value);
  //     print("Token: $value & Saved to Shared Preferences");
  //   } else {
  //     _sharedPreferences?.remove('firebaseDeviceToken');
  //   }
  // }

  String? get firebaseDeviceToken {
    return _getStorage?.read('firebaseDeviceToken');
  }

  // Set Locale from Shared Preferences
  String? get locale {
    return _getStorage?.read(_Key.locale.toString()) ?? 'en';
  }

  set locale(String? value) {
    if (value != null) {
      _getStorage?.write(_Key.locale.toString(), value);
    } else {
      _getStorage?.remove(_Key.locale.toString());
    }
  }

  Future<void> saveData(String key, String value) async {
    await _getStorage?.write(key, value);
  }

  Future<dynamic> getData(String key) async {
    return await _getStorage?.read(key);
  }

  void clearAll() {
    _getStorage?.erase();
  }
}
