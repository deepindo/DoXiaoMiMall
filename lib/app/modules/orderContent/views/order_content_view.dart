import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_content_controller.dart';

class OrderContentView extends GetView<OrderContentController> {
  const OrderContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderContentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OrderContentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
