import 'dart:convert';

import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const _accessToken = '_accessToken';  // luu token

  static const _userEntity = '_userEntity';  // luu thong tin nguoi dung

  static const _didOnboardKey = '_didOnboardKey'; // check xem no da xem onboard chua / true: da xem , false: chua


  //Get onboard
  static Future<bool> getOnboard() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_didOnboardKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  //Set onboard
  static Future<void> setOnboard({onBoard = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_didOnboardKey, onBoard ?? true);
  }


  //Get accessToken
  static Future<String?> getAccessToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(_accessToken);
  }

  //Set _accessToken
  static void setAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessToken, accessToken);
  }

  //delete access token
  static void removeAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessToken);
  }

  //Set _accessToken
  static void setUserEntity(UserEntity userEntity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tmp =  json.encode(userEntity.toJson());
    await prefs.setString(_userEntity, tmp);
  }

  //delete access token
  static Future<UserEntity> getUserEntity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   var tmp =   prefs.getString(_userEntity);
   var user = json.decode(tmp ?? '');
   return UserEntity.fromJson(user);
  }

}
