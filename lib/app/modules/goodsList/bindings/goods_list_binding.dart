import 'package:get/get.dart';

import '../controllers/goods_list_controller.dart';

class GoodsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoodsListController>(
      () => GoodsListController(),
    );
  }
}
