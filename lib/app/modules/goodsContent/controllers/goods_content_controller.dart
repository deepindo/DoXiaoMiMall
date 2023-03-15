import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GoodsContentController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxDouble opacity = 0.0.obs;
  RxBool showTabs = false.obs; //默认不显示tabs
  GlobalKey gk0 = GlobalKey(); //商品页
  GlobalKey gk1 = GlobalKey(); //详情页
  GlobalKey gk2 = GlobalKey(); //推荐页

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

  List<Map> paramteterList = [
    {"id": 0, "title": "CPU", "sub_title": "天玑8100", "icon": ""},
    {"id": 1, "title": "三摄像头", "sub_title": "6400万像素", "icon": ""},
    {"id": 2, "title": "超大屏", "sub_title": "6.6英寸", "icon": ""},
    {"id": 3, "title": "屏幕分辨率", "sub_title": "2460x1080", "icon": ""},
    {"id": 4, "title": "极速畅玩", "sub_title": "最高12GB", "icon": ""},
    {"id": 5, "title": "存储容量", "sub_title": "最高512GB", "icon": ""},
    {"id": 6, "title": "普通厚度", "sub_title": "8.87mm", "icon": ""},
    {"id": 7, "title": "超长待机", "sub_title": "5080mAh", "icon": ""},
    {"id": 8, "title": "运营商类型", "sub_title": "5G全网通", "icon": ""},
    {"id": 9, "title": "网络模式", "sub_title": "双卡双待", "icon": ""},
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
