import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vip_code_controller.dart';

class VipCodeView extends GetView<VipCodeController> {
  const VipCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('我的会员码'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VipCodeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
