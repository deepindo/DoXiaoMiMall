import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_password_login_controller.dart';

class AccountPasswordLoginView extends GetView<AccountPasswordLoginController> {
  const AccountPasswordLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('账号密码登录'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AccountPasswordLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
