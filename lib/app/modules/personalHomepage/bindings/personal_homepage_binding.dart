import 'package:get/get.dart';

import '../controllers/personal_homepage_controller.dart';

class PersonalHomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalHomepageController>(
      () => PersonalHomepageController(),
    );
  }
}
