import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/verification_code_controller.dart';

class VerificationCodeView extends GetView<VerificationCodeController> {
  const VerificationCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('获取验证码'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VerificationCodeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
