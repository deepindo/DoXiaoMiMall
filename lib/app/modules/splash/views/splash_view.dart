import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../../services/app_colors.dart';
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
    return Stack(
      children: [
        //后续这个走接口配置
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
        Positioned(
            left: (DoScreenAdapter.screenW() - DoScreenAdapter.w(170)) * 0.5,
            right: (DoScreenAdapter.screenW() - DoScreenAdapter.w(170)) * 0.5,
            bottom: DoScreenAdapter.adapterBottomH() + DoScreenAdapter.h(30),
            height: DoScreenAdapter.h(35),
            child: InkWell(
              onTap: () {
                ///取消定时器，不然到时间会自动执行跳转
                controller.timer.cancel();
                //后续这个走接口配置
                Get.toNamed("/web", arguments: {
                  "url":
                      "https://book.flutterchina.club/chapter12/flutter_web.html"
                })!
                    .then((value) => controller.jumpToMain());
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(DoScreenAdapter.w(35))),
                child: Text(
                  "查看详情",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: DoScreenAdapter.fs(14),
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
      ],
    );
  }

  // 跳过按钮
  Widget _skipButton() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
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
    return SizedBox(
      width: DoScreenAdapter.screenW(),
      height: DoScreenAdapter.screenH(),
      child: Obx(
        () => Swiper(
          autoplay: false,
          loop: false,
          itemCount: controller.guideImgList.length,
          onIndexChanged: (value) {},
          onTap: (index) {},
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
                            color: DoColors.gray154,
                            activeColor: Colors.white,
                          ).build(context, config),
                        ),
                      )
                    ],
                  ),
                );
              })),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Image.asset(
                  controller.guideImgList[index],
                  fit: BoxFit.fill,
                ),
                index == controller.guideImgList.length - 1
                    ? Positioned(
                        left: (DoScreenAdapter.screenW() -
                                DoScreenAdapter.w(170)) *
                            0.5,
                        right: (DoScreenAdapter.screenW() -
                                DoScreenAdapter.w(170)) *
                            0.5,
                        bottom: DoScreenAdapter.adapterBottomH(),
                        height: DoScreenAdapter.h(35),
                        child: InkWell(
                          onTap: () {
                            controller.setLaunchedFlag("launched");
                            controller.jumpToMain();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(
                                    DoScreenAdapter.w(35))),
                            child: Text(
                              "进入app",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: DoScreenAdapter.fs(14),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                    : const Positioned(
                        left: 0,
                        bottom: 0,
                        child: SizedBox(width: 0, height: 0)),
              ],
            );
          },
        ),
      ),
    );
  }
}
