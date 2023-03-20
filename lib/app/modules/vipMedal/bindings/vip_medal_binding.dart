import 'package:get/get.dart';

import '../controllers/vip_medal_controller.dart';

class VipMedalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VipMedalController>(
      () => VipMedalController(),
    );
  }
}
