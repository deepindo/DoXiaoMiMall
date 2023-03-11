import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxBool flag = false.obs;
  RxDouble ratio = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      print(scrollController.position.pixels);

      double scrollPixels = scrollController.position.pixels;
      double criticalValue = 40;
      double delta = scrollPixels / criticalValue;
      ratio.value = delta > 1 ? 1 : delta;

      //应该是渐变的，不是直接一下变的
      if (scrollController.position.pixels > 30 && flag.value == false) {
        // print("pixels > 10----${flag.value}");
        // if (flag.value == false) {
        flag.value = true;
        // print("pixels-true");
        // update();
        // }
      }

      if (scrollController.position.pixels < 30 && flag.value == true) {
        // print("pixels < 10----${flag.value}");
        // if (flag.value == true) {
        flag.value = false;
        // print("pixels-------false");
        // }
      }
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
