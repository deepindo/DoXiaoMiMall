import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(
      () => ThemeController(),
    );
  }
}
