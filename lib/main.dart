import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/services/app_colors.dart';
import 'app/services/app_language.dart';

void main() {
  //flutter 修改状态栏的颜色
  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
            onInit: () {
              print("GetMaterialApp onInit");
            },
            // initialBinding: ,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.grey),
            // darkTheme: ,
            themeMode: ThemeMode.system,
            defaultTransition: Transition.rightToLeft,
            builder: EasyLoading.init(),
            translations: Messages(), // 你的翻译
            locale: const Locale("zh", "CN"), // 将会按照此处指定的语言翻译
            fallbackLocale:
                const Locale("en", "US"), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('zh'),
              Locale('en'), // English
              Locale('fr'), // French
              Locale('ko'), // Korean-N&S
              Locale('ja'), // Janpanese
              Locale('de'), // German
              Locale('es'), // Spanish
            ],
          );
        }),
  );

  FlutterNativeSplash.remove();

  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..animationDuration = const Duration(milliseconds: 100)
    ..loadingStyle = EasyLoadingStyle.custom
    ..displayDuration = const Duration(milliseconds: 1000)

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
    // ..textStyle = const TextStyle(
    // fontSize: 12, color: Colors.white) //这个设置后，上面单独的text设置不生效
    ..textPadding = const EdgeInsets.only(top: 10)
    ..successWidget =
        const Icon(Icons.check_outlined, size: 20, color: Colors.white)
    ..errorWidget = const Icon(Icons.close, size: 20, color: Colors.white)

    ///mask遮罩
    ..maskType = EasyLoadingMaskType.none
    // ..maskColor = Colors.black.withOpacity(0.2) //EasyLoadingMaskType.custom生效
    /// 当loading展示的时候，是否允许用户操作.
    ..userInteractions = false

    /// 点击背景是否关闭-loading展示false
    ..dismissOnTap = true;

  // ..customAnimation = CustomAnimation();
}
