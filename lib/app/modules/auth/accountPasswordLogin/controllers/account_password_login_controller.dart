import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../..//services/app_network.dart';
import '../../../..//services/app_userService.dart';
import '../../../../models/response_model.dart';
import '../../../me/controllers/me_controller.dart';

class AccountPasswordLoginController extends GetxController {
  MeController meController = Get.find();
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoginButtonEnable = false.obs;
  RxBool isCheckedProtocol = false.obs;
  RxBool isObscure = true.obs;

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

    ///本页面关闭的时候，获取用户信息刷新
    meController.getUserInfo();
  }

  ///更新登录按钮状态
  void updateLoginButtonState() {
    isLoginButtonEnable.value = (accountController.text.length == 11 &&
            passwordController.text.length >= 8)
        ? true
        : false;
    update();
  }

  void updateObscureState() {
    isObscure.value = !isObscure.value;
    update();
  }

  Future<ResponseModel> login() async {
    var data = await DoNetwork().post(loginPath, data: {
      "username": accountController.text,
      "password": passwordController.text
    });
    print("login-----:$data");
    if (data != null) {
      if (data["success"]) {
        DoUserService.setUserInfo(data["userinfo"]);
        return ResponseModel(success: true, message: "登录成功");
      } else {
        return ResponseModel(success: false, message: data["message"]);
      }
    } else {
      return ResponseModel(success: false, message: data["请求失败"]);
    }
  }
}
