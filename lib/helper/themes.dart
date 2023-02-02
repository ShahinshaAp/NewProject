import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_data_modell.dart';



abstract class Themes {
 
  static SharedPreferences? prefss;
  static Future init() async => prefss = await SharedPreferences.getInstance();
  
 

  static Future<UserdDataModel?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'user_data';
    if (prefs.getString(key) != null) {
      final value = json.decode(prefs.getString(key)!);
      log('Get User Data: $value');
      var name = value['name'];
      log("user name: $name");
      return UserdDataModel.fromJson(value);
    } else {
      print("get user null");
      return null;
    }
  }

  static Future<bool> saveUserData(Map userData) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'user_data';
    final value = json.encode(userData);
    log('Save User Data $value');
    return prefs.setString(key, value);
  }

 

 

  static Future<bool> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'user_data';
    return prefs.remove(key);
  }

 

  

 

  

 

  

 

 

  


 
}
