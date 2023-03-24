import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/personal_homepage_controller.dart';

class PersonalHomepageView extends GetView<PersonalHomepageController> {
  const PersonalHomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('个人信息'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("message");
              },
              icon: const Icon(
                Icons.notifications_none_outlined,
                // size: 20,
              ))
        ],
      ),
      body: const Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
