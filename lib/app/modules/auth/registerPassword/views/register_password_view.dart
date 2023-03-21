import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_password_controller.dart';

class RegisterPasswordView extends GetView<RegisterPasswordController> {
  const RegisterPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterPasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisterPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
