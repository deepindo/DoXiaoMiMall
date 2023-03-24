import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../models/response_model.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../../../../components/app_components.dart';
import '../controllers/verification_code_login_controller.dart';

class VerificationCodeLoginView
    extends GetView<VerificationCodeLoginController> {
  const VerificationCodeLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    inputFormatters: [LengthLimitingTextInputFormatter(11)],
                    textAlignVertical: TextAlignVertical.center,
                    controller: controller.phoneController,
                    keyboardType: TextInputType.number,
                    cursorColor: DoColors.theme,
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
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.phoneController.text = "";
                          },
                          child: Icon(Icons.close_outlined,
                              size: DoScreenAdapter.fs(18)),
                        )),
                    onChanged: (value) {
                      controller.isSendCodeButtonEnable.value =
                          (controller.phoneController.text.length == 11)
                              ? true
                              : false;
                    },
                    onSubmitted: (value) {},
                  ),
                ),
              ],
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
                        controller.isSendCodeButtonEnable.value
                            ? DoColors.theme
                            : DoColors.yellow253),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: !controller.isSendCodeButtonEnable.value
                    ? null
                    : () async {
                        if (GetUtils.isPhoneNumber(
                            controller.phoneController.text)) {
                          if (controller.isCheckedProtocol.value) {
                            //自动收起键盘
                            FocusScope.of(Get.context!)
                                .requestFocus(FocusNode());
                            EasyLoading.show(status: "获取中...");
                            ResponseModel response =
                                await controller.requestVerificationCode();
                            if (response.success) {
                              // Get.toNamed("/verification-code", arguments: {
                              //   "phone": controller.phoneController.text
                              // });
                              ///替换路由
                              Get.offAndToNamed("/verification-code",
                                  arguments: {
                                    "phone": controller.phoneController.text
                                  });
                              EasyLoading.showSuccess(response.message);
                            } else {
                              EasyLoading.showError(response.message);
                            }
                          } else {
                            EasyLoading.showToast("请先同意协议");
                          }
                        } else {
                          EasyLoading.showError("请输入正确的手机号");
                        }
                      },
                child: Text("获取验证码",
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
                    ///替换路由
                    Get.offAndToNamed("/account-password-login");
                  },
                  child: Text("密码登录",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                          color: DoColors.black51)))
            ],
          ),
        ],
      ),
    );
  }
}
