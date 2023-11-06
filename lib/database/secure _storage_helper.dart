// ignore_for_file: file_names

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper{

  static const _apiTokenKey = '_apiTokenKey';

  final FlutterSecureStorage _storage;

  SecureStorageHelper._(this._storage);

  static final SecureStorageHelper _instance =
  SecureStorageHelper._(const FlutterSecureStorage());

  static SecureStorageHelper get instance => _instance;

  // void saveToken(TokenEntity token) async {
  //   await _storage.write(key: _apiTokenKey, value: jsonEncode(token.toJson()));
  // }
}