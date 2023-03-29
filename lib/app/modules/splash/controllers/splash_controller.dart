import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  RxInt seconds = 5.obs;

  @override
  void onInit() {
    super.onInit();
    _initTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///初始化定时器
  void _initTimer() {
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      seconds.value--;

      if (seconds.value <= 0) {
        timer.cancel();
        jumpToMain();
      }
      update();
    });
  }

  ///跳转到主页
  void jumpToMain() {
    Get.offAllNamed("/tabs");
  }

  ///SplashPage分为三种情况：默认启动图(与闪屏页区别开)，引导图(最后一张按钮跳过)，广告图(倒计时跳过)
  ///对应状态分别为0，1，2
  ///
}
