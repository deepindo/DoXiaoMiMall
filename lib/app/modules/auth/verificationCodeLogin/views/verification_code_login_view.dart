import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../controllers/verification_code_login_controller.dart';

class VerificationCodeLoginView
    extends GetView<VerificationCodeLoginController> {
  const VerificationCodeLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Get.toNamed("/register");
              },
              child: Text(
                "注册",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14), color: DoColors.black51),
              )),
          TextButton(
              onPressed: () {
                Get.toNamed("/account-help");
              },
              child: Text(
                "帮助",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14), color: DoColors.black51),
              ))
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: [_listView(), _bottomView()],
    );
  }

  Widget _listView() {
    return ListView(
      children: [
        Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/logo.png",
              width: DoScreenAdapter.w(50),
              height: DoScreenAdapter.w(50),
            )),
        Container(
          color: Colors.cyan,
          height: DoScreenAdapter.h(80),
        ),
        Wrap(
          children: [
            Text("已阅读并同意"),
            Text("《小米商城用户协议》"),
            Text("《小米商城隐私政策》"),
            Text("《小米账号用户协议》"),
            Text("《小米账号隐私政策》"),
          ],
        ),
        ElevatedButton(
            onPressed: () {
              Get.toNamed("/verification-code");
            },
            child: Text("获取验证码")),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Get.toNamed("/reset-password");
                },
                child: Text("忘记密码")),
            TextButton(
                onPressed: () {
                  Get.toNamed("/account-password-login");
                },
                child: Text("密码登录"))
          ],
        ),
      ],
    );
  }

  Widget _bottomView() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: DoScreenAdapter.h(80),
      child: Container(
        child: Column(
          children: [
            Text("其他方式登录"),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.wechat)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.mail)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.apple)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
