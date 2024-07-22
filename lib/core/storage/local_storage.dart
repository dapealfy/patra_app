import 'dart:convert';
import 'package:app/core/constant/storage_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  LocalStorageService._();
  static LocalStorageService? _instance;
  static LocalStorageService get instance =>
      _instance ?? LocalStorageService._();
  final _storage = const FlutterSecureStorage();
  final String _token = '';
  final String _isLoggedIn = 'is_login';

  ///------------------LoggedIn------------------------------------------
  void setIsLoggedIn() async {
    await _storage.write(key: _isLoggedIn, value: 'true');
  }

  dynamic getIsLoggedIn() async {
    final data = await _storage.read(key: _isLoggedIn);
    return data;
  }

  void setRole(String role) async {
    await _storage.write(key: 'role', value: role);
  }

  dynamic getRole() async {
    final data = await _storage.read(key: 'role');
    return data;
  }

  ///-----------------------------------------------------------------------------

  /*-------------------------------TOKEN--------------------------------------------------- */
  ///set Token
  void setToken(String token) async {
    await _storage.write(key: _token, value: token);
  }

  ///get Token
  dynamic getToken() async {
    final data = await _storage.read(key: _token);
    return data;
  }

  /*-------------------------------DELETEALL--------------------------------------------------- */
  Future<void> deleteAll() async => await _storage.deleteAll();

  Future<void> set<T>(StorageKeyEnum key, T value) async =>
      await _storage.write(key: key.name, value: jsonEncode(value));

  Future<T?> get<T>(StorageKeyEnum key) async {
    try {
      return (jsonDecode(await _storage.read(key: key.name) ?? '') as T?);
    } catch (e) {
      return null;
    }
  }
}
