import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/address_modify_controller.dart';

class AddressModifyView extends GetView<AddressModifyController> {
  const AddressModifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddressModifyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddressModifyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
