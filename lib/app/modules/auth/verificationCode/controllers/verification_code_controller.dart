import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/app_network.dart';
import '../../../../models/response_model.dart';
import '../../../../services/app_userService.dart';
import '../../../me/controllers/me_controller.dart';

class VerificationCodeController extends GetxController {
  MeController meController = Get.find();
  TextEditingController codeController = TextEditingController();
  String phone = Get.arguments["phone"];
  RxInt seconds = 60.obs;

  @override
  void onInit() {
    super.onInit();
    countDecrement();
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
    // codeController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    // codeController.dispose();
  }

  ///倒计时
  void countDecrement() {
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      seconds.value--;
      if (seconds.value == 0) {
        timer.cancel();
      }
      update();
    });
  }

  ///获取验证码
  Future<ResponseModel> requestVerificationCode() async {
    var data = await DoNetwork().post(sendLoginCodePath, data: {"tel": phone});
    print("requestVerificationCode-----:$data");
    if (data != null) {
      // return data["success"] ? true : false;
      if (data["success"]) {
        ///测试阶段，将接口返回的短信验证码直接设置到粘贴板
        Clipboard.setData(ClipboardData(text: data["code"]));
        //重置定时器
        seconds.value = 60;
        countDecrement();
        //
        update();
        return ResponseModel(success: true, message: "发送成功");
      } else {
        return ResponseModel(success: false, message: data["message"]);
      }
    } else {
      return ResponseModel(success: false, message: data["请求失败"]);
    }
  }

  ///校验验证码并（若是新用户就注册+）登录
  Future<ResponseModel> validateCodeAndLogin() async {
    print("----${codeController.text}");
    var data = await DoNetwork().post(validateLoginCodePath,
        data: {"tel": phone, "code": codeController.text});
    print("validateCodeAndLogin-----:$data");
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
