import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../../category/views/category_view.dart';
import '../../service/views/service_view.dart';
import '../../cart/views/cart_view.dart';
import '../../me/views/me_view.dart';

class TabsController extends GetxController {
  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
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
    // pageController.jumpTo(1);
    // setCurrentIndex(1);
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
