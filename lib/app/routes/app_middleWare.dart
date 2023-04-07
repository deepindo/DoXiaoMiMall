import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/app_userService.dart';

class DoMiddlewares extends GetMiddleware {
  RxBool isLogined = false.obs;
  void judgeIsLogined() async {
    isLogined.value = await DoUserService.isLogin();
    // print(isLogined.value);
  }

  @override
  RouteSettings? redirect(String? route) {
    judgeIsLogined();
    return isLogined.value
        ? super.redirect(route)
        : const RouteSettings(name: "/verification-code-login");
  }
}
