import 'package:get/get.dart';

class CheckoutController extends GetxController {
  List checkoutList =
      Get.arguments != null ? Get.arguments["checkoutList"] : [];

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
  }

  void increment() => count.value++;
}
