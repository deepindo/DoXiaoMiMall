import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/app_network.dart';
import '../../../../models/response_model.dart';

class RegisterPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isRegisterButtonEnable = false.obs;
  String phone = Get.arguments["phone"];
  String code = Get.arguments["code"];

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

  ///更新注册按钮状态
  void updateRegisterButtonState() {
    isRegisterButtonEnable.value = (passwordController.text.isNotEmpty &&
            confirmPasswordController.text.isNotEmpty)
        ? true
        : false;
    update();
  }

  Future<ResponseModel> register() async {
    var data = await DoNetwork().post(registerPath, data: {
      "tel": phone,
      "code": code,
      "password": passwordController.text
    });
    print("register-----:$data");
    if (data != null) {
      if (data["success"]) {
        return ResponseModel(success: true, message: "注册成功");
      } else {
        return ResponseModel(success: false, message: data["message"]);
      }
    } else {
      return ResponseModel(success: false, message: data["请求失败"]);
    }
  }
}
