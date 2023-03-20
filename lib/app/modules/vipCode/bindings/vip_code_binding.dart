import 'package:get/get.dart';

import '../controllers/vip_code_controller.dart';

class VipCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VipCodeController>(
      () => VipCodeController(),
    );
  }
}
