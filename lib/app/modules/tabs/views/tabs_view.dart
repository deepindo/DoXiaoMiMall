import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: PageView(
          controller: controller.pageController,
          children: controller.pages,
          onPageChanged: (value) {
            controller.setCurrentIndex(value);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // fixedColor: Colors.green,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentIndex.value,
            onTap: (value) {
              controller.setCurrentIndex(value);
              controller.pageController.jumpToPage(value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.room_service), label: "服务"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "购物车"),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: "我的")
            ]),
      ),
    );
  }

  // BottomNavigationBarItem _bottomNavigationBarItem() {
  //   return BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页");
  // }
}
