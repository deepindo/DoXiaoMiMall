import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        Container(height: DoScreenAdapter.h(40), color: Colors.cyan),
        _commonListTile("密保手机", onTap: () {}),
        _commonListTile("收货地址", onTap: () {}),
        Container(height: DoScreenAdapter.h(10), color: DoColors.gray238),
        _commonListTile("消息推送", onTap: () {}),
        _commonListTile("隐私设置", onTap: () {
          print("隐私设置");
        }),
        _commonListTile("小米商城隐私政策", onTap: () {
          print("小米商城隐私政策");
        }),
        _commonListTile("小米商城隐私政策-简要版", onTap: () {}),
        Container(height: DoScreenAdapter.h(10), color: DoColors.gray238),
        _commonListTile("关于商城", onTap: () {
          print("关于商城");
        }),
        _commonListTile("网络诊断", onTap: () {}),
        _commonListTile("个人信息收集与使用清单", onTap: () {}),
        _commonListTile("个人信息第三方共享清单", onTap: () {}),
        _commonListTile("协议规则", onTap: () {}),
        _commonListTile("资质证照", onTap: () {}),
        _commonListTile("小米商城用户协议", onTap: () {}),
        _commonListTile("小米账号用户协议", onTap: () {}),
        _commonListTile("小米账号隐私政策", onTap: () {}),
        Container(height: DoScreenAdapter.h(10), color: DoColors.gray238),
        TextButton(
            onPressed: () async {
              await DoUserService.removeUserInfo();
              Get.offAllNamed("/tabs");
              Get.snackbar("提示", "退出登录");
            },
            child: Text("退出账号",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14),
                    color: DoColors.black51))),
        // ElevatedButton(
        //   onPressed: () {
        //     Get.snackbar("提示", "退出登录");
        //   },
        //   style: ButtonStyle(
        //     elevation: MaterialStateProperty.all(0),
        //     overlayColor: MaterialStateProperty.all(Colors.white),
        //     shadowColor: MaterialStateProperty.all(Colors.white),
        //     // shape: MaterialStateProperty.all(RoundedRectangleBorder(
        //     //     borderRadius:
        //     //         BorderRadius.circular(DoScreenAdapter.w(20)))),
        //     backgroundColor: MaterialStateProperty.all(Colors.white),
        //     // foregroundColor: MaterialStateProperty.all(Colors.white)
        //   ),
        //   child:
        //       Text("退出账号", style: TextStyle(fontSize: DoScreenAdapter.fs(14))),
        // ),
        Container(height: DoScreenAdapter.h(60), color: DoColors.gray238),
      ],
    );
  }

  Widget _commonListTile(String data, {void Function()? onTap}) {
    return Container(
      // height: DoScreenAdapter.h(30), //用于改变ListTile的高
      // alignment: Alignment.centerLeft,
      child: ListTile(
        // contentPadding: EdgeInsets.all(DoScreenAdapter.w(10)),
        title: Text(data, style: TextStyle(fontSize: DoScreenAdapter.fs(14))),
        trailing: Icon(Icons.arrow_forward_ios_outlined,
            size: DoScreenAdapter.fs(12), color: DoColors.black128),
        onTap: onTap,
      ),
    );
  }
}
