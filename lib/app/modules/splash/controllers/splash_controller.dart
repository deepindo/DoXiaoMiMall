import 'dart:async';
import 'package:get/get.dart';
import '../../../services/app_sharedPreferences.dart';

String FIRSTLAUNCHKEY = "FirstLaunch";

class SplashController extends GetxController {
  late Timer timer;
  RxBool isShowGuide = false.obs;
  RxInt seconds = 5.obs;
  RxList guideImgList = [
    "assets/images/guide/guide_1.jpg",
    "assets/images/guide/guide_2.jpg",
    "assets/images/guide/guide_3.jpg",
    "assets/images/guide/guide_4.jpg"
  ].obs;

  @override
  void onInit() {
    super.onInit();

    judge();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void judge() async {
    String str = await getFirstLaunch();
    isShowGuide.value = str != "launched" ? true : false;
    if (!isShowGuide.value) {
      _initTimer();
    }
    update();
  }

  ///初始化定时器
  void _initTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      seconds.value--;

      if (seconds.value <= 0) {
        timer.cancel();
        jumpToMain();
      }
      update();
    });
  }

  void setLaunchedFlag(String launched) async {
    await setFirstLaunch(launched);
  }

  ///跳转到主页
  void jumpToMain() {
    Get.offAllNamed("/tabs");
  }

  ///SplashPage分为三种情况：默认启动图(与闪屏页区别开)，引导图(最后一张按钮跳过)，广告图(倒计时跳过)
  ///对应状态分别为0，1，2
  ///
  ///----本地存储
  ///存储
  static setFirstLaunch(String launched) async {
    await DoSharedPreferences.setData(FIRSTLAUNCHKEY, launched);
  }

  ///获取
  static Future<String> getFirstLaunch() async {
    var data = await DoSharedPreferences.getData(FIRSTLAUNCHKEY);
    if (data != null && data != "") {
      return data;
    } else {
      return "";
    }
  }

  ///移除
  static removeFirstLaunch() async {
    await DoSharedPreferences.removeData(FIRSTLAUNCHKEY);
  }
}
