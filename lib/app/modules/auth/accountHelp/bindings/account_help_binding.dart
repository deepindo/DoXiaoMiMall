import 'package:get/get.dart';

import '../controllers/account_help_controller.dart';

class AccountHelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountHelpController>(
      () => AccountHelpController(),
    );
  }
}
