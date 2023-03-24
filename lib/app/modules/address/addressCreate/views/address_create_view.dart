import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/address_create_controller.dart';

class AddressCreateView extends GetView<AddressCreateController> {
  const AddressCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddressCreateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddressCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
