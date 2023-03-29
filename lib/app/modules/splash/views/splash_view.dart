import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('SplashView'),
      //   centerTitle: true,
      // ),
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
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
}
