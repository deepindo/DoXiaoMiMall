import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../controllers/verification_code_controller.dart';

class VerificationCodeView extends GetView<VerificationCodeController> {
  const VerificationCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('获取验证码'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() {
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "请输入验证码",
              style: TextStyle(
                  fontSize: DoScreenAdapter.fs(14),
                  color: DoColors.black51,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: DoScreenAdapter.h(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("已发送至",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(12),
                        color: DoColors.gray154)),
                SizedBox(width: DoScreenAdapter.w(5)),
                Text("+86 176****6789",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(12),
                        color: DoColors.black51,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        SizedBox(height: DoScreenAdapter.h(20)),
        PinCodeTextField(
          appContext: Get.context!,
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          animationDuration: const Duration(milliseconds: 300),
          // backgroundColor: Colors.blue.shade50,
          enableActiveFill: true,
          // errorAnimationController: errorController,
          // controller: textEditingController,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box, //多种风格
            borderRadius: BorderRadius.circular(5),
            fieldHeight: DoScreenAdapter.w(40),
            fieldWidth: DoScreenAdapter.w(40),
            borderWidth: DoScreenAdapter.w(1),
            inactiveColor: DoColors.yellow254, //未输入的边框色
            inactiveFillColor: DoColors.yellow254, //未输入的填充色
            selectedColor: DoColors.theme,
            selectedFillColor: Colors.white,
            activeColor: Colors.green,
            activeFillColor: Colors.white,
            disabledColor: DoColors.gray249,
            errorBorderColor: Colors.red,
          ),
          onCompleted: (v) {
            print("Completed");
          },
          onChanged: (value) {
            print(value);
            // setState(() {
            //   currentText = value;
            // });
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  // Get.toNamed("/reset-password");
                },
                child: Text("重新发送(${controller.seconds})",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(14),
                        color: DoColors.gray154))),
            TextButton(
                onPressed: () {
                  Get.toNamed("/account-help");
                },
                child: Text("获取帮助",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(14),
                        color: const Color.fromARGB(255, 107, 183, 245))))
          ],
        ),
      ],
    );
  }
}
