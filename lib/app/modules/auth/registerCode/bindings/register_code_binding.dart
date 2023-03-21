import 'package:get/get.dart';

import '../controllers/register_code_controller.dart';

class RegisterCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCodeController>(
      () => RegisterCodeController(),
    );
  }
}
