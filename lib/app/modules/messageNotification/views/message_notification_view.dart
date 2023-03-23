import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import '../controllers/message_notification_controller.dart';

class MessageNotificationView extends GetView<MessageNotificationController> {
  const MessageNotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('消息通知'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                EasyLoading.showToast("清除未读消息红点？");
              },
              icon: const Icon(
                Icons.brush_outlined,
                // size: 20,
              ))
        ],
      ),
      body: const Center(
        child: Text(
          'MessageNotificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
