import 'package:get/get.dart';

import '../controllers/verification_code_login_controller.dart';

class VerificationCodeLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationCodeLoginController>(
      () => VerificationCodeLoginController(),
    );
  }
}
