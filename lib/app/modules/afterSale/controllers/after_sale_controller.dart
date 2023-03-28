import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AfterSaleController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  int initialIndex = Get.arguments != null ? Get.arguments["initialIndex"] : 0;

  ///tab标签列表
  RxList<Widget> tabBarList = const [
    Tab(text: "售后申请"),
    Tab(text: "进度查询"),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    initialPage();
    addTabControllerListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  ///初始化页面
  void initialPage() {
    tabController = TabController(
        length: tabBarList.length, vsync: this, initialIndex: initialIndex);
    switch (initialIndex) {
      case 0:
        print("initialIndex -0");

        break;
      case 1:
        print("initialIndex -1");

        break;
      default:
    }
  }

  void addTabControllerListener() {
    tabController.addListener(() {
      //滚动&点击切换都可以监听
      if (tabController.animation!.value == tabController.index) {
        ///执行请求？
        print("addListener-${tabController.index}");
      }
    });
  }

  void tapToChangeIndex() {
    print("tapToChangeIndex");
  }
}
