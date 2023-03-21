import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationCodeLoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  RxBool isSendCodeButtonEnable = false.obs;
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
}
