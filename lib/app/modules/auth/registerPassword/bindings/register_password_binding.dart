import 'package:get/get.dart';

import '../controllers/register_password_controller.dart';

class RegisterPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterPasswordController>(
      () => RegisterPasswordController(),
    );
  }
}
