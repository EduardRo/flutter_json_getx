import 'cache_manager.dart';
import 'package:get/get.dart';
import 'authentication_manager.dart';
import 'home_view.dart';
import 'login_view.dart';
import 'onboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}
