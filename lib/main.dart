import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app/services/app_colors.dart';

void main() {
  //flutter 修改状态栏的颜色
  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  runApp(
    ScreenUtilInit(
        //填入设计稿中设备的屏幕尺寸,单位dp
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.grey),
            defaultTransition: Transition.rightToLeft,
            builder: EasyLoading.init(),
          );
        }),
  );

  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..displayDuration = const Duration(milliseconds: 2000)

    ///loading就是框
    ..loadingStyle = EasyLoadingStyle.custom //框为custom下面4个生效
    ..backgroundColor = DoColors.black128 //框的背景色
    ..indicatorColor = Colors.white
    ..progressColor = Colors.white
    ..textColor = Colors.white
    ..fontSize = 12
    ..radius = 5.0
    // ..contentPadding =
    // const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)

    ///indicator就是指示器
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorSize = 45.0
    // ..textStyle = const TextStyle(fontSize: 12, color: Colors.white) //这个设置后，上面单独的text设置不生效
    ..textPadding = const EdgeInsets.only(top: 10)
    ..errorWidget = const Icon(Icons.close, size: 20)

    ///mask遮罩
    ..maskType = EasyLoadingMaskType.none
    ..maskColor = Colors.black.withOpacity(0.2) //EasyLoadingMaskType.custom生效
    /// 当loading展示的时候，是否允许用户操作.
    ..userInteractions = false

    /// 点击背景是否关闭-loading展示false
    ..dismissOnTap = true;

  // ..customAnimation = CustomAnimation();
}
