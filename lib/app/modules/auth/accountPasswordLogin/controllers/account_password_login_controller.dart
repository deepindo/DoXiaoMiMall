import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPasswordLoginController extends GetxController {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoginButtonEnable = false.obs;
  RxBool isCheckedProtocol = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  ///更新登录按钮状态
  void updateLoginButtonState() {
    // print("account:${accountController.text}");
    // print("password:${passwordController.text}");
    // if (accountController.text.isNotEmpty &&
    //     passwordController.text.isNotEmpty) {
    //   print("都真");
    // } else {
    //   print("有假");
    // }
    isLoginButtonEnable.value = (accountController.text.isNotEmpty &&
            passwordController.text.isNotEmpty)
        ? true
        : false;
    // print(isLoginButtonEnable.value);
    update();
  }
}
