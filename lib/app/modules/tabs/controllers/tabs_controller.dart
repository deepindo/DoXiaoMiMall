import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../../category/views/category_view.dart';
import '../../service/views/service_view.dart';
import '../../cart/views/cart_view.dart';
import '../../me/views/me_view.dart';

class TabsController extends GetxController {
  RxInt currentIndex = 0.obs;
  // PageController pageController = PageController(initialPage: 0);

  // PageController pageController =
  //     PageController(initialPage: Get.arguments["initialPage"] ?? 0);
  //Get.arguments可能没有,Get.arguments["initialPage"]的写法会直接报错，应该先判断外层
  PageController pageController = Get.arguments != null
      ? PageController(initialPage: Get.arguments["initialPage"])
      : PageController(initialPage: 0);

  final List<Widget> pages = [
    const HomeView(),
    const CategoryView(),
    const ServiceView(),
    CartView(),
    const MeView(),
  ];

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      currentIndex.value = Get.arguments["initialPage"];
      update();
    }
    //下面的写法不好
    // currentIndex.value =
    //     Get.arguments != null ? Get.arguments["initialPage"] : 0;
    // update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //设置当前索引
  void setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }
}
