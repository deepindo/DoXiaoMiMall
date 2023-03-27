import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_list_controller.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OrderListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
