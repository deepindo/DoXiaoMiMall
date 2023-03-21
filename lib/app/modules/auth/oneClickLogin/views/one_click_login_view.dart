import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../../../../components/app_components.dart';
import '../controllers/one_click_login_controller.dart';

class OneClickLoginView extends GetView<OneClickLoginController> {
  const OneClickLoginView({Key? key}) : super(key: key);
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
    return ListView(
      padding: EdgeInsets.all(DoScreenAdapter.w(20)),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //不包个Row硬是显示不出来
          children: [
            CircleAvatar(
              radius: DoScreenAdapter.w(30),
              foregroundImage:
                  const AssetImage("assets/images/avatar_default.png"),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: DoScreenAdapter.h(20)),
          // width: DoScreenAdapter.w(60),
          // height: DoScreenAdapter.w(60),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/images/user.png"),
          //         fit: BoxFit.cover),
          //     borderRadius: BorderRadius.circular(DoScreenAdapter.w(30))),
          // child: CircleAvatar(
          //   radius: DoScreenAdapter.w(20),
          //   backgroundImage: AssetImage("assets/images/user.png"),

          // child: Image.asset(
          //   "assets/images/user.png",
          //   width: DoScreenAdapter.w(50),
          //   height: DoScreenAdapter.w(50),
          // ),
        ),
        Text("156******69",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: DoScreenAdapter.fs(20),
                color: DoColors.black128,
                fontWeight: FontWeight.bold)),
        SizedBox(height: DoScreenAdapter.h(20)),
        Obx(
          () => commonProtocolView(
              isOneClick: true,
              controller.isCheckedProtocol.value, onTap: (selected) {
            controller.isCheckedProtocol.value = selected!;
          }),
        ),
        SizedBox(height: DoScreenAdapter.h(10)),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(DoScreenAdapter.w(20)))),
                backgroundColor: MaterialStateProperty.all(DoColors.theme),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              Get.snackbar("提示", "一键登录");
            },
            child: Text("本机号码一键登录",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14),
                    fontWeight: FontWeight.bold))),
        TextButton(
            onPressed: () {
              Get.toNamed("/verification-code-login");
            },
            child: Text("使用其他账号",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14),
                    color: DoColors.black51))),
      ],
    );
  }
}
