import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../../../../components/app_components.dart';
import '../../../../models/response_model.dart';
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
    return GestureDetector(
      onTap: () {
        //自动收起键盘
        FocusScope.of(Get.context!).requestFocus(FocusNode());
      },
      child: ListView(
        padding: EdgeInsets.all(DoScreenAdapter.w(20)),
        children: [
          commonLogoView(),
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
                  Text("+86 ${controller.phone.replaceRange(3, 7, '****')}",
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
            controller: controller.codeController,
            length: 6,
            obscureText: false,
            cursorColor: DoColors.theme,
            keyboardType: TextInputType.number,
            animationType: AnimationType.fade,
            animationDuration: const Duration(milliseconds: 300),
            // backgroundColor: Colors.blue.shade50,
            enableActiveFill: true,
            // errorAnimationController: errorController,
            // controller: textEditingController,
            dialogConfig: DialogConfig(
                //汉化dialog
                dialogTitle: "粘贴验证码",
                dialogContent: "确定要粘贴验证码？",
                affirmativeText: "确定",
                negativeText: "取消"),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box, //多种风格
              borderRadius: BorderRadius.circular(5),
              fieldHeight: DoScreenAdapter.w(40),
              fieldWidth: DoScreenAdapter.w(40),
              // borderWidth: DoScreenAdapter.w(1),
              inactiveColor: DoColors.yellow254, //未输入的边框色
              inactiveFillColor: DoColors.yellow254, //未输入的填充色
              selectedColor: DoColors.yellow254, //当前选中的边框色
              selectedFillColor: Colors.white,
              activeColor: DoColors.yellow254, //输入过的边框色
              activeFillColor: Colors.white,
              disabledColor: DoColors.gray249,
              errorBorderColor: Colors.red,
            ),
            onCompleted: (v) async {
              print("Completed");
              //自动收起键盘
              FocusScope.of(Get.context!).requestFocus(FocusNode());
              EasyLoading.show(status: "登录中...");
              ResponseModel response = await controller.validateCodeAndLogin();
              if (response.success) {
                // Get.offAllNamed("/tabs", arguments: {"initialPage": 4});
                ///前一个页面使用了替换路由
                Get.back();
                EasyLoading.showSuccess(response.message);
              } else {
                EasyLoading.showError(response.message);
              }
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
              Obx(
                () => controller.seconds.value > 0
                    ? TextButton(
                        onPressed: null,
                        child: Text("${controller.seconds.value}秒后重新获取验证码",
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(14),
                                color: DoColors.gray154)))
                    : TextButton(
                        onPressed: () async {
                          EasyLoading.show(status: "获取中...");
                          ResponseModel response =
                              await controller.requestVerificationCode();
                          if (response.success) {
                            EasyLoading.showSuccess(response.message);
                          } else {
                            EasyLoading.showError(response.message);
                          }
                        },
                        child: Text("重新获取验证码",
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(14),
                                color: DoColors.gray154))),
              ),
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
      ),
    );
  }
}
