import 'package:get/get.dart';

import '../controllers/me_controller.dart';

class MeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeController>(
      () => MeController(),
    );
  }
}
