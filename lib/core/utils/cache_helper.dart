import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:metw_go/core/const/app_const.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  // static late SharedPreferences sharedPreference;

  // static Future<void> init() async {
  //   sharedPreference = await SharedPreferences.getInstance();
  //   // CacheHelper.getData(key: "lang") ??
  //   //     CacheHelper.saveData(key: SharedPreferencesKeys.lang, value: "ar");
  // }

  static Future<void> saveUserData(UserModel userModel) async {
    final userDataString = const JsonEncoder().convert(userModel.toJson());
    await getIt<SharedPreferences>().setString(
      AppConstant.userData,
      userDataString,
    );
    // await getIt<SharedPreferences>().setInt(PrefsKeys.roleId, userData.roleId);
  }

  static UserModel? getUserData() {
    final userDataString = getIt<SharedPreferences>().getString(
      AppConstant.userData,
    );
    if (userDataString == null) {
      return null;
    }
    final userData = UserModel.fromJson(jsonDecode(userDataString));
    return userData;
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      final sharedPreference = getIt<SharedPreferences>();
      return await sharedPreference.setInt(key, value);
    }
    if (value is String) {
      final sharedPreference = getIt<SharedPreferences>();
      return await sharedPreference.setString(key, value);
    }
    if (value is bool) {
      final sharedPreference = getIt<SharedPreferences>();
      return await sharedPreference.setBool(key, value);
    }
    final sharedPreference = getIt<SharedPreferences>();
    return await sharedPreference.setDouble(key, value);
  }

  static Future<bool> saveDataList({
    required String key,
    required List<String> value,
  }) async {
    final sharedPreference = getIt<SharedPreferences>();
    return await sharedPreference.setStringList(key, value);
  }

  static Future<List<String>?> getStringList({required String key}) async {
    final sharedPreference = getIt<SharedPreferences>();
    final value = sharedPreference.getStringList(key);
    return value;
  }

  static dynamic getData({required String key}) {
    final sharedPreference = getIt<SharedPreferences>();
    return sharedPreference.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    final sharedPreference = getIt<SharedPreferences>();
    return await sharedPreference.remove(key);
  }

  /// save Strings with Secure
  /// exampel secure token and passwords
  static Future<void> setSecuerString({
    required String key,
    required String value,
  }) async {
    final FlutterSecureStorage flutterSecureStorage =
        getIt<FlutterSecureStorage>();
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<void> removeSecuerString({required String key}) async {
    final FlutterSecureStorage flutterSecureStorage =
        getIt<FlutterSecureStorage>();
    await flutterSecureStorage.delete(key: key);
  }

  /// get  Strings with Secure
  /// exampel secure token and passwords
  static Future<String> getSecuerString({required String key}) async {
    final FlutterSecureStorage flutterSecureStorage =
        getIt<FlutterSecureStorage>();
    return await flutterSecureStorage.read(key: key) ?? "";
  }

  static Future<void> clearAll() async {
    removeData(key: AppConstant.userData);
    removeData(key: AppConstant.isLogin);
    removeSecuerString(key: AppConstant.accessToken);
  }
}
