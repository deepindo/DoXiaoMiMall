import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../../../../components/app_components.dart';
import '../controllers/account_password_login_controller.dart';

class AccountPasswordLoginView extends GetView<AccountPasswordLoginController> {
  const AccountPasswordLoginView({Key? key}) : super(key: key);
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
        commonThirdLoginView(), //键盘会顶起来，是一个问题
      ],
    );
  }

  Widget _listView() {
    return GestureDetector(
      onTap: () {
        //自动收起键盘
        FocusScope.of(Get.context!).requestFocus(FocusNode());
      },
      child: ListView(
        padding: EdgeInsets.all(DoScreenAdapter.w(20)),
        children: [
          commonLogoView(),
          Container(
            alignment: Alignment.center,
            height: DoScreenAdapter.h(50),
            padding: EdgeInsets.only(left: DoScreenAdapter.w(15)),
            decoration: BoxDecoration(
                color: DoColors.gray249,
                borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              controller: controller.accountController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  color: DoColors.black0,
                  fontSize: DoScreenAdapter.fs(16),
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "小米账号/手机号/邮箱",
                  hintStyle: TextStyle(
                      color: DoColors.gray168,
                      fontSize: DoScreenAdapter.fs(16),
                      fontWeight: FontWeight.bold),
                  suffixIcon:
                      Icon(Icons.close_outlined, size: DoScreenAdapter.fs(18))),
              onChanged: (value) {
                controller.updateLoginButtonState();
              },
              onSubmitted: (value) {},
            ),
          ),
          SizedBox(height: DoScreenAdapter.h(10)),
          Container(
            alignment: Alignment.center,
            height: DoScreenAdapter.h(50),
            padding: EdgeInsets.only(left: DoScreenAdapter.w(15)),
            decoration: BoxDecoration(
                color: DoColors.gray249,
                borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              controller: controller.passwordController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  color: DoColors.black0,
                  fontSize: DoScreenAdapter.fs(16),
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "密码",
                  hintStyle: TextStyle(
                      color: DoColors.gray168,
                      fontSize: DoScreenAdapter.fs(16),
                      fontWeight: FontWeight.bold),
                  suffixIcon:
                      Icon(Icons.close_outlined, size: DoScreenAdapter.fs(18))),
              onChanged: (value) {
                controller.updateLoginButtonState();
              },
              onSubmitted: (value) {},
            ),
          ),
          SizedBox(height: DoScreenAdapter.h(20)),
          Obx(
            () => commonProtocolView(
              controller.isCheckedProtocol.value,
              onTap: (selected) {
                controller.isCheckedProtocol.value = selected!;
              },
            ),
          ),
          SizedBox(height: DoScreenAdapter.h(10)),
          Obx(
            () => ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(DoScreenAdapter.w(20)))),
                    backgroundColor: MaterialStateProperty.all(
                        controller.isLoginButtonEnable.value
                            ? DoColors.theme
                            : DoColors.yellow253),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: !controller.isLoginButtonEnable.value
                    ? null
                    : () {
                        if (controller.accountController.text.isNotEmpty &&
                            controller.passwordController.text.isNotEmpty) {
                          // Get.toNamed("/verification-code");
                          //登录
                        } else {
                          Get.snackbar("提示", "请输入正确的账号和密码");
                        }
                      },
                child: Text("登录",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(14),
                        fontWeight: FontWeight.bold))),
          ),
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
                    Get.back();
                  },
                  child: Text("验证码登录",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                          color: DoColors.black51)))
            ],
          ),
        ],
      ),
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
}
