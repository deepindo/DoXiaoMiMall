import 'package:get/get.dart';

import '../controllers/verification_code_controller.dart';

class VerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationCodeController>(
      () => VerificationCodeController(),
    );
  }
}
