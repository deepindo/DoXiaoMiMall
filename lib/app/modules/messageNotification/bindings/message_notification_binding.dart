import 'package:get/get.dart';

import '../controllers/message_notification_controller.dart';

class MessageNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageNotificationController>(
      () => MessageNotificationController(),
    );
  }
}
