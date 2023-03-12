import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/goods_content_controller.dart';

class GoodsContentView extends GetView<GoodsContentController> {
  const GoodsContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoodsContentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GoodsContentView is working------',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
