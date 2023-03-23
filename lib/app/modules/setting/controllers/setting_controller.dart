import 'package:get/get.dart';
// import '../../me/controllers/me_controller.dart';

class SettingController extends GetxController {
  // MeController meController = Get.find();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    print("设置页面onClose执行么");
    // meController.getUserInfo();
  }

  void increment() => count.value++;
}
