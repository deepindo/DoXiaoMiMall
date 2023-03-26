import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../components/app_components.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_screenAdapter.dart';
import '../../../services/app_userService.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoColors.gray249,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('设置'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        _profileSection(),
        commonListTile("密保手机", onTap: () {}),
        commonListTile("收货地址", onTap: () {
          Get.toNamed("address-manager");
        }),
        Container(height: DoScreenAdapter.h(10), color: DoColors.gray238),
        commonListTile("消息推送", onTap: () {}),
        commonListTile("隐私设置", onTap: () {
          // print("隐私设置");
        }),
        commonListTile("小米商城隐私政策", onTap: () {
          // print("小米商城隐私政策");
        }),
        commonListTile("小米商城隐私政策-简要版", onTap: () {}),
        Container(height: DoScreenAdapter.h(10), color: DoColors.gray238),
        commonListTile("关于商城", onTap: () {
          // print("关于商城");
        }),
        commonListTile("网络诊断", onTap: () {}),
        commonListTile("个人信息收集与使用清单", onTap: () {}),
        commonListTile("个人信息第三方共享清单", onTap: () {}),
        commonListTile("协议规则", onTap: () {}),
        commonListTile("资质证照", onTap: () {}),
        commonListTile("小米商城用户协议", onTap: () {}),
        commonListTile("小米账号用户协议", onTap: () {}),
        commonListTile("小米账号隐私政策", onTap: () {}),
        Container(height: DoScreenAdapter.h(10), color: DoColors.gray238),
        _logouButton(),
        // Container(height: DoScreenAdapter.h(60), color: DoColors.gray238)
      ],
    );
  }

  Widget _profileSection() {
    return Obx(
      () => InkWell(
        onTap: () {
          Get.toNamed("/profile");
        },
        child: Container(
          height: DoScreenAdapter.h(50),
          padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: DoScreenAdapter.w(25),
                      backgroundImage:
                          const AssetImage("assets/images/avatar_man.png"),
                    ),
                  ),
                  SizedBox(
                    width: DoScreenAdapter.w(10),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.userModel.value.username}",
                        style: TextStyle(
                            fontSize: DoScreenAdapter.fs(14),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: DoScreenAdapter.h(5)),
                      Container(
                        padding: EdgeInsets.all(DoScreenAdapter.w(3)),
                        decoration: BoxDecoration(
                            color: DoColors.gray238,
                            borderRadius:
                                BorderRadius.circular(DoScreenAdapter.w(10))),
                        child: Text(
                          "小米ID${controller.userModel.value.sId}",
                          style: TextStyle(fontSize: DoScreenAdapter.fs(10)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.arrow_forward_ios_outlined,
                      size: DoScreenAdapter.fs(12), color: DoColors.black128)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logouButton() {
    return TextButton(
        onPressed: () {
          DoUserService.removeUserInfo();
          // Get.back();
          Get.offAllNamed("/tabs");
          EasyLoading.showSuccess("退出登录");
        },
        child: Text("退出账号",
            style: TextStyle(
                fontSize: DoScreenAdapter.fs(14), color: DoColors.black51)));
    ;
  }
}
