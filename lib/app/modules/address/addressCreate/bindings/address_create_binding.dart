import 'package:get/get.dart';

import '../controllers/address_create_controller.dart';

class AddressCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressCreateController>(
      () => AddressCreateController(),
    );
  }
}
