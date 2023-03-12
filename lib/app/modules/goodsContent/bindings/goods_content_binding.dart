import 'package:get/get.dart';

import '../controllers/goods_content_controller.dart';

class GoodsContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoodsContentController>(
      () => GoodsContentController(),
    );
  }
}
