import 'package:get/get.dart';

import '../controllers/order_content_controller.dart';

class OrderContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderContentController>(
      () => OrderContentController(),
    );
  }
}
