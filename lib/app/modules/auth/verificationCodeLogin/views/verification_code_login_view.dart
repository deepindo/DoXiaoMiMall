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
      children: [
        _listView(),
        _bottomView(), //键盘会顶起来，是一个问题
      ],
    );
  }

  Widget _listView() {
    return ListView(
      padding: EdgeInsets.all(DoScreenAdapter.w(20)),
      children: [
        Container(
            margin: EdgeInsets.only(bottom: DoScreenAdapter.h(20)),
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/logo.png",
              width: DoScreenAdapter.w(50),
              height: DoScreenAdapter.w(50),
            )),
        Container(
          // alignment: Alignment.center,
          height: DoScreenAdapter.h(50),
          padding: EdgeInsets.only(left: DoScreenAdapter.w(15)),
          decoration: BoxDecoration(
              color: DoColors.gray249,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
          child: Row(
            children: [
              Row(children: [
                Text("+86",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(16),
                        color: DoColors.black128,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: DoScreenAdapter.fs(15),
                )
              ]),
              SizedBox(width: DoScreenAdapter.w(10)),
              Expanded(
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: controller.phoneController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: DoColors.black0,
                      fontSize: DoScreenAdapter.fs(16),
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      // contentPadding: EdgeInsets.zero,//这个设置不设置，都主要看textAlignVertical才能使水平居中
                      border: InputBorder.none,
                      hintText: "请输入手机号",
                      hintStyle: TextStyle(
                          color: DoColors.gray168,
                          fontSize: DoScreenAdapter.fs(16),
                          fontWeight: FontWeight.bold),
                      suffixIcon: Icon(Icons.close_outlined,
                          size: DoScreenAdapter.fs(18))),
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: DoScreenAdapter.h(20)),
        Wrap(
          runSpacing: DoScreenAdapter.w(5),
          // spacing: DoScreenAdapter.w(5),
          children: [
            Container(
              width: DoScreenAdapter.w(15),
              height: DoScreenAdapter.w(15),
              alignment: Alignment.center,
              child: Checkbox(
                  activeColor: DoColors.theme,
                  value: true,
                  onChanged: (value) {}),
            ),
            Text("已阅读并同意",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(12), color: DoColors.gray154)),
            Text("《小米商城用户协议》",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(12), color: DoColors.theme)),
            Text("《小米商城隐私政策》",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(12), color: DoColors.theme)),
            Text("《小米账号用户协议》",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(12), color: DoColors.theme)),
            Text("《小米账号隐私政策》",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(12), color: DoColors.theme)),
          ],
        ),
        SizedBox(height: DoScreenAdapter.h(10)),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(DoScreenAdapter.w(20)))),
                backgroundColor: MaterialStateProperty.all(DoColors.yellow253),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              Get.toNamed("/verification-code");
            },
            child: Text("获取验证码",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14),
                    fontWeight: FontWeight.bold))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  Get.toNamed("/reset-password");
                },
                child: Text("忘记密码",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(14),
                        color: DoColors.black51))),
            TextButton(
                onPressed: () {
                  Get.toNamed("/account-password-login");
                },
                child: Text("密码登录",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(14),
                        color: DoColors.black51)))
          ],
        ),
      ],
    );
  }

  ///底部固定区域-第三方登录
  Widget _bottomView() {
    return Positioned(
      left: DoScreenAdapter.h(60),
      right: DoScreenAdapter.h(60),
      bottom: DoScreenAdapter.h(20), //太高了会被键盘推到遮盖上面的组件
      // bottom: 0,
      child: Column(
        children: [
          Text("- 其他方式登录 -",
              style: TextStyle(
                  fontSize: DoScreenAdapter.fs(12), color: DoColors.gray154)),
          SizedBox(height: DoScreenAdapter.h(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 206, 247, 221),
                      radius: DoScreenAdapter.w(15),
                      child: const Icon(Icons.wechat,
                          color: Colors.green, size: 18))),
              InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 149, 199, 240),
                      radius: DoScreenAdapter.w(15),
                      child: const Icon(Icons.facebook,
                          color: Colors.blue, size: 18))),
              InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 244, 150, 143),
                      radius: DoScreenAdapter.w(15),
                      child:
                          const Icon(Icons.mail, color: Colors.red, size: 18))),
              InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: DoScreenAdapter.w(15),
                      child: const Icon(Icons.apple,
                          color: Colors.white, size: 18)))
            ],
          )
        ],
      ),
    );
  }

  ///有问题
  // Widget _thirdCircleButton(IconData? icon,
  //     {Color? foreColor, Color? backColor, void Function()? onTap}) {
  //   return InkWell(
  //       onTap: onTap,
  //       child: CircleAvatar(
  //           backgroundColor: backColor,
  //           radius: DoScreenAdapter.w(15),
  //           child: const Icon(icon, color: foreColor, size: 18)));
  // }
}
