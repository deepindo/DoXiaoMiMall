import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_help_controller.dart';

class AccountHelpView extends GetView<AccountHelpController> {
  const AccountHelpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('小米账号帮助中心'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AccountHelpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
