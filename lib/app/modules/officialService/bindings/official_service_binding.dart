import 'package:get/get.dart';

import '../controllers/official_service_controller.dart';

class OfficialServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfficialServiceController>(
      () => OfficialServiceController(),
    );
  }
}
