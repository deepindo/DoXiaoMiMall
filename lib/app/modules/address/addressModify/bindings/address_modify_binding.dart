import 'package:get/get.dart';

import '../controllers/address_modify_controller.dart';

class AddressModifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressModifyController>(
      () => AddressModifyController(),
    );
    // Get.put(
    //   AddressModifyController(),
    // );
  }
}
