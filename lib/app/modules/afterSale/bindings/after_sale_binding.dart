import 'package:get/get.dart';

import '../controllers/after_sale_controller.dart';

class AfterSaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AfterSaleController>(
      () => AfterSaleController(),
    );
  }
}
