import 'package:get/get.dart';

class VerificationCodeController extends GetxController {
  RxInt seconds = 69.obs;

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
  }

  void decrement() {
    if (seconds.value > 1) {
      seconds.value--;
      update();
    }
  }
}
