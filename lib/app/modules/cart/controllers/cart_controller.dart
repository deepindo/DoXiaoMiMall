import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool isShowEditingButton = true.obs;
  RxBool isShowBottomFloatingView = true.obs;
  List cartList = [];

  // final count = 0.obs;
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

  // void increment() => count.value++;
}
