import '../../../services/app_screenAdapter.dart';
import 'package:get/get.dart';
// import '../../me/controllers/me_controller.dart';

class SettingController extends GetxController {
  // MeController meController = Get.find();

  @override
  void onInit() {
    // print("onInit b-SettingController");
    // print(DoScreenAdapter.statusH());
    // print(DoScreenAdapter.bottomH());
    super.onInit();
    // print("onInit a-SettingController");
  }

  @override
  void onReady() {
    // print("onReady b-SettingController");
    super.onReady();
    // print("onReady a-SettingController");
  }

  @override
  void onClose() {
    // print("设置页面onClose执行么");
    // meController.getUserInfo();
    // print("onClose b-SettingController");
    // print(DoScreenAdapter.statusH());
    // print(DoScreenAdapter.bottomH());
    super.onClose();
    // print("onClose a-SettingController");
  }

  @override
  void dispose() {
    // print("before dispose SettingController");
    super.dispose();
    // print("after dispose SettingController");
  }

  ///控制器中有方法在view中执行，才会触发lazyPut的controller执行onInit等方法，
  ///否则，那怕页面一直在打开关闭也不会执行
  // void test() {
  //   print("test lazyPut and put when call");
  // }
}
