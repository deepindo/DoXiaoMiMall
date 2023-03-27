import 'package:get/get.dart';

import '../controllers/order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderListController>(
      () => OrderListController(),
    );
  }
}
