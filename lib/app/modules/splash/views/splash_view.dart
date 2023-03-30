import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    ///判断第一次打开app，展示引导页，后面展示活动页
    return Obx(
        () => controller.isShowGuide.value ? _guidePage() : _advertisingPage());
  }

  ///广告页
  Widget _advertisingPage() {
    return InkWell(
      onTap: () {
        Get.toNamed("/web", arguments: {
          "url": "https://book.flutterchina.club/chapter12/flutter_web.html"
        });
      },
      child: Stack(
        children: [
          Image.asset(
            'assets/images/launch_02.png',
            fit: BoxFit.cover,
            width: DoScreenAdapter.screenW(),
            height: DoScreenAdapter.screenH(),
          ),
          Positioned(
            top: DoScreenAdapter.navH() + DoScreenAdapter.h(10),
            right: DoScreenAdapter.w(20),
            child: InkWell(
              onTap: () {
                controller.jumpToMain();
              },
              child: _skipButton(),
            ),
          ),
        ],
      ),
    );
  }

  // 跳过按钮
  Widget _skipButton() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(DoScreenAdapter.w(25)),
        ),
        width: DoScreenAdapter.w(50),
        height: DoScreenAdapter.w(50),
        // color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "跳过",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            Obx(
              () => Text(
                "${controller.seconds.value}s",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: DoScreenAdapter.fs(15),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ));
  }

  ///引导页
  Widget _guidePage() {
    return Container(
      color: Colors.white,
      width: DoScreenAdapter.screenW(),
      height: DoScreenAdapter.screenH(),
      child: Obx(
        () => Swiper(
          autoplay: false,
          loop: false,
          itemCount: controller.guideImgList.length,
          onIndexChanged: (value) {
            // if (value == controller.guideImgList.length - 1) {
            //   controller.setLaunchedFlag("launched");
            //   controller.jumpToMain();
            // }
          },
          onTap: (index) {
            if (index == controller.guideImgList.length - 1) {
              controller.setLaunchedFlag("launched");
              controller.jumpToMain();
            }
          },
          // pagination: const SwiperPagination(builder: SwiperPagination.rect),
          pagination: SwiperPagination(
              margin: const EdgeInsets.all(0.0),
              builder: SwiperCustomPagination(
                  builder: (BuildContext context, SwiperPluginConfig config) {
                return ConstrainedBox(
                  constraints: BoxConstraints.expand(
                      height: DoScreenAdapter.bottomH()), //隔底部的间距
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: const RectSwiperPaginationBuilder(
                            color: Colors.black12,
                            activeColor: Colors.white,
                          ).build(context, config),
                        ),
                      )
                    ],
                  ),
                );
              })),
          itemBuilder: (context, index) {
            return Image.asset(
              controller.guideImgList[index],
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }
}
