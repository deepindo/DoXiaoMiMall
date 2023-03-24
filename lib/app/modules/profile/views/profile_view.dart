import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/app_components.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('个人资料'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        commonListTile("头像", onTap: () {}),
        commonListTile("昵称", onTap: () {
          // Get.toNamed("address-manager");
        }),
        commonListTile("性别", onTap: () {}),
        commonListTile("生日", onTap: () {
          // print("隐私设置");
        }),
        commonListTile("小米ID", onTap: () {
          // print("小米商城隐私政策");
        }),
        commonListTile("记住登录信息", onTap: () {}),
        Container(height: DoScreenAdapter.h(10), color: DoColors.gray238),
        commonListTile("收货地址", onTap: () {}),
        commonListTile("密码设置", onTap: () {}),
        commonListTile("密保手机", onTap: () {}),
        commonListTile("第三方账号", onTap: () {}),
      ],
    );
  }
}
