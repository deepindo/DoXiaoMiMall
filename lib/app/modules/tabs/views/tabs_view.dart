import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import '../../../services/app_screenAdapter.dart';
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
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  DoFontIcons.homeNormal,
                  color: DoColors.black51,
                ),
                activeIcon: Icon(DoFontIcons.homeSelected),
                label: "首页",
              ),
              const BottomNavigationBarItem(
                  icon: Icon(
                    DoFontIcons.categoryNormal,
                    color: DoColors.black51,
                  ),
                  activeIcon: Icon(DoFontIcons.categorySelected),
                  label: "分类"),
              const BottomNavigationBarItem(
                  icon: Icon(
                    DoFontIcons.serviceNormal,
                    color: DoColors.black51,
                  ),
                  activeIcon: Icon(DoFontIcons.serviceSelected),
                  label: "服务"),
              BottomNavigationBarItem(
                  icon: badges.Badge(
                    position: badges.BadgePosition.topEnd(
                        top: DoScreenAdapter.h(-5),
                        end: DoScreenAdapter.w(-15)),
                    badgeAnimation: const badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 1),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    badgeStyle: badges.BadgeStyle(
                        padding: EdgeInsets.all(DoScreenAdapter.w(5))),
                    badgeContent: Container(
                      alignment: Alignment.center,
                      child: Text("99",
                          style: TextStyle(
                              fontSize: DoScreenAdapter.fs(10),
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    child: const Icon(
                      DoFontIcons.cartNormal,
                      color: DoColors.black51,
                    ),
                  ),
                  activeIcon: badges.Badge(
                      position: badges.BadgePosition.topEnd(
                          top: DoScreenAdapter.h(-5),
                          end: DoScreenAdapter.w(-15)),
                      badgeAnimation: const badges.BadgeAnimation.rotation(
                        animationDuration: Duration(seconds: 1),
                        colorChangeAnimationDuration: Duration(seconds: 1),
                        loopAnimation: false,
                        curve: Curves.fastOutSlowIn,
                        colorChangeAnimationCurve: Curves.easeInCubic,
                      ),
                      badgeStyle: badges.BadgeStyle(
                          padding: EdgeInsets.all(DoScreenAdapter.w(5))),
                      badgeContent: Container(
                        alignment: Alignment.center,
                        child: Text("99",
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(10),
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      child: const Icon(DoFontIcons.cartSelected)),
                  label: "购物车"),
              const BottomNavigationBarItem(
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
