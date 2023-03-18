import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_fontIcons.dart';
import '../../../services/app_colors.dart';
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
            selectedItemColor: DoColors.theme,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentIndex.value,
            onTap: (value) {
              controller.setCurrentIndex(value);
              controller.pageController.jumpToPage(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  DoFontIcons.homeNormal,
                  color: DoColors.black51,
                ),
                activeIcon: Icon(DoFontIcons.homeSelected),
                label: "首页",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    DoFontIcons.categoryNormal,
                    color: DoColors.black51,
                  ),
                  activeIcon: Icon(DoFontIcons.categorySelected),
                  label: "分类"),
              BottomNavigationBarItem(
                  icon: Icon(
                    DoFontIcons.serviceNormal,
                    color: DoColors.black51,
                  ),
                  activeIcon: Icon(DoFontIcons.serviceSelected),
                  label: "服务"),
              BottomNavigationBarItem(
                  icon: Icon(
                    DoFontIcons.cartNormal,
                    color: DoColors.black51,
                  ),
                  activeIcon: Icon(DoFontIcons.cartSelected),
                  label: "购物车"),
              BottomNavigationBarItem(
                  icon: Icon(
                    DoFontIcons.meNormal,
                    color: DoColors.black51,
                  ),
                  activeIcon: Icon(DoFontIcons.meSelected),
                  label: "我的")
            ]),
      ),
    );
  }
}
