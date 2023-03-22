import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/app_network.dart';
import '../../../../models/response_model.dart';

class RegisterController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  RxBool isSendCodeButtonEnable = false.obs;
  RxBool isCheckedProtocol = false.obs;

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

  ///获取验证码
  Future<ResponseModel> requestVerificationCode() async {
    var data = await DoNetwork()
        .post(sendCodePath, data: {"tel": phoneController.text});
    print("requestVerificationCode-----:$data");
    if (data != null) {
      // return data["success"] ? true : false;
      if (data["success"]) {
        ///测试阶段，将接口返回的短信验证码直接设置到粘贴板
        Clipboard.setData(ClipboardData(text: data["code"]));
        return ResponseModel(success: true, message: "发送成功");
      } else {
        return ResponseModel(success: false, message: data["message"]);
      }
    } else {
      return ResponseModel(success: false, message: data["请求失败"]);
    }
  }
}
