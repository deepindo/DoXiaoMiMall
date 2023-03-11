import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxBool flag = false.obs;
  RxDouble ratio = 0.0.obs;
  RxList bannerList = [].obs;

  @override
  void onInit() {
    super.onInit();

    _addScrollListener();
    _requestBannerData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _addScrollListener() {
    scrollController.addListener(() {
      // print(scrollController.position.pixels);

      double scrollPixels = scrollController.position.pixels;
      double criticalValue = 40; //这个要判断，什么系统，什么屏幕等，完全不一样，不然有问题
      double delta = scrollPixels / criticalValue;
      ratio.value = delta > 1 ? 1 : (delta < 0 ? 0 : delta);

      //应该是渐变的，不是直接一下变的
      if (scrollController.position.pixels > criticalValue &&
          flag.value == false) {
        // print("pixels > 10----${flag.value}");
        // if (flag.value == false) {
        flag.value = true;
        // print("pixels-true");
        // update();
        // }
      }

      if (scrollController.position.pixels < criticalValue &&
          flag.value == true) {
        // print("pixels < 10----${flag.value}");
        // if (flag.value == true) {
        flag.value = false;
        // print("pixels-------false");
        // }
      }
      update();
    });
  }

  void _requestBannerData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/focus/");
    print(response);
    bannerList.value = response.data["result"];
    update();
  }
}
