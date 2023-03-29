import 'package:get/get.dart';

import '../controllers/address_manager_controller.dart';

class AddressManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressManagerController>(
      () => AddressManagerController(),
    );
    // Get.put(
    //   AddressManagerController(),
    // );
  }
}
