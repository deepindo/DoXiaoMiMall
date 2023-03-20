import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vip_medal_controller.dart';

class VipMedalView extends GetView<VipMedalController> {
  const VipMedalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('小米会员勋章'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VipMedalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
