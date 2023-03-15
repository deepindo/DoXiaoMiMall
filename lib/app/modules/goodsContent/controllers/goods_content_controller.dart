import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GoodsContentController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxDouble opacity = 0.0.obs;
  RxBool showTabs = false.obs; //默认不显示tabs
  GlobalKey gk1 = GlobalKey(); //商品页
  GlobalKey gk2 = GlobalKey(); //详情页
  GlobalKey gk3 = GlobalKey(); //推荐页

  RxInt selectedTabsIndex = 0.obs; //默认三个
  List tabsList = [
    {"id": 0, "title": "商品"},
    {"id": 1, "title": "详情"},
    {"id": 2, "title": "推荐"}
  ];
  RxInt selectedSubTabsIndex = 0.obs; //二级标题，可能是两个，可能是
  List subTabsList = [
    {"id": 0, "title": "商品介绍"},
    {"id": 1, "title": "规格参数"},
    {"id": 2, "title": "安装须知"},
  ];

  @override
  void onInit() {
    super.onInit();
    _addScrollListener();
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
      double scrollPixels = scrollController.position.pixels;
      double criticalValue = 100; //这个要判断，什么系统，什么屏幕等，完全不一样，不然有问题
      double delta = scrollPixels / criticalValue;
      opacity.value = delta > 1 ? 1 : (delta < 0 ? 0 : delta);

      ///tabs的显示与appBar不一样，不是渐变的，是突然显示的，
      ///但同时不是以完整的临界值criticalValue来比较的，目前按一半来
      // double tabsDelta = scrollPixels / (criticalValue * 0.5);
      // showTabs.value = tabsDelta > 1 ? true : false;
      showTabs.value = scrollPixels > (criticalValue * 0.5) ? true : false;
      print("showTabs.value--${showTabs.value}");
      update();
    });
  }

  void changeTabsSelectedIndex(int index) {
    selectedTabsIndex.value = index;
    update();
  }
}
