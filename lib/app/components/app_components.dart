import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import '../services/app_colors.dart';
import '../services/app_screenAdapter.dart';

///通用标题头组件
Widget commonHeader(
    {required String title, Widget? trailing, Function()? onTap}) {
  return SizedBox(
    height: DoScreenAdapter.h(40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        // IconButton(onPressed: onPressed, icon: Icon(icon)),
        InkWell(
          onTap: onTap,
          child: Container(
            child: trailing,
          ),
        ),
      ],
    ),
  );
}

///登录注册前同意协议
Widget commonRoundCheckBox(bool isChecked,
    {required dynamic Function(bool?)? onTap}) {
  return Container(
    padding: EdgeInsets.all(DoScreenAdapter.w(10)),
    child: RoundCheckBox(
      onTap: onTap,
      checkedColor: DoColors.theme,
      checkedWidget:
          Icon(Icons.check, color: Colors.white, size: DoScreenAdapter.fs(12)),
      // uncheckedWidget: Icon(Icons.close, size: DoScreenAdapter.fs(12)),
      uncheckedColor: Colors.white,
      disabledColor: Colors.grey[300],
      animationDuration: const Duration(milliseconds: 50),
      isRound: true,
      isChecked: isChecked,
      size: 20,
      border: Border.all(
        width: 1,
        color: isChecked ? DoColors.theme : DoColors.gray154, //根据选择状态来改
      ),
    ),
  );
}

///logo
Widget commonLogoView() {
  return Container(
      margin: EdgeInsets.only(bottom: DoScreenAdapter.h(20)),
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/logo.png",
        width: DoScreenAdapter.w(50),
        height: DoScreenAdapter.w(50),
      ));
}

///登录注册前同意协议
Widget commonProtocolView(bool isChecked,
    {required dynamic Function(bool?)? onTap}) {
  return Wrap(
    runSpacing: DoScreenAdapter.w(3),
    spacing: DoScreenAdapter.w(1),
    children: [
      Container(
        width: DoScreenAdapter.w(15),
        height: DoScreenAdapter.w(15),
        alignment: Alignment.center,
        child: RoundCheckBox(
          onTap: onTap,
          checkedColor: DoColors.theme,
          checkedWidget: Icon(Icons.check,
              color: Colors.white, size: DoScreenAdapter.fs(12)),
          // uncheckedWidget: Icon(Icons.close, size: DoScreenAdapter.fs(12)),
          uncheckedColor: Colors.white,
          disabledColor: Colors.grey[300],
          animationDuration: const Duration(milliseconds: 50),
          isRound: true,
          isChecked: isChecked,
          size: 15,
          border: Border.all(
            width: 1,
            color: isChecked ? DoColors.theme : DoColors.gray154, //根据选择状态来改
          ),
        ),
        // Checkbox(
        //     activeColor: DoColors.theme, value: true, onChanged: (value) {}),
      ),
      Text("已阅读并同意",
          style: TextStyle(
              fontSize: DoScreenAdapter.fs(12), color: DoColors.gray154)),
      InkWell(
        onTap: () {
          print("小米商城用户协议》");
        },
        child: Text("《小米商城用户协议》",
            style: TextStyle(
                fontSize: DoScreenAdapter.fs(12), color: DoColors.theme)),
      ),
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
  );
}

///底部固定区域-第三方登录
Widget commonThirdLoginView() {
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
                    child:
                        const Icon(Icons.apple, color: Colors.white, size: 18)))
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
