import 'package:get/get.dart';

import '../controllers/account_password_login_controller.dart';

class AccountPasswordLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountPasswordLoginController>(
      () => AccountPasswordLoginController(),
    );
  }
}
