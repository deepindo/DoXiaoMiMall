import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_fontIcons.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/customer_service_controller.dart';

class CustomerServiceView extends GetView<CustomerServiceController> {
  const CustomerServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '小米客服',
          style: TextStyle(
              fontSize: DoScreenAdapter.fs(16), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                DoFontIcons.message,
                color: Colors.black87,
              )),
        ],
      ),
      body: const Center(
        child: Text(
          'CustomerServiceView is coming',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
