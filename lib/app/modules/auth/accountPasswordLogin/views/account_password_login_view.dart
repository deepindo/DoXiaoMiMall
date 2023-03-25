import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../models/response_model.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../../../../components/app_components.dart';
import '../controllers/account_password_login_controller.dart';

class AccountPasswordLoginView extends GetView<AccountPasswordLoginController> {
  const AccountPasswordLoginView({Key? key}) : super(key: key);
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
            alignment: Alignment.center,
            height: DoScreenAdapter.h(50),
            padding: EdgeInsets.only(left: DoScreenAdapter.w(15)),
            decoration: BoxDecoration(
                color: DoColors.gray249,
                borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
            child: TextField(
              inputFormatters: [LengthLimitingTextInputFormatter(11)],
              textAlignVertical: TextAlignVertical.center,
              controller: controller.accountController,
              keyboardType: TextInputType.number,
              cursorColor: DoColors.theme,
              style: TextStyle(
                  color: DoColors.black0,
                  fontSize: DoScreenAdapter.fs(16),
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "手机号(小米账号/邮箱暂时没有)",
                  hintStyle: TextStyle(
                      color: DoColors.gray168,
                      fontSize: DoScreenAdapter.fs(16),
                      fontWeight: FontWeight.bold),
                  suffixIcon: InkWell(
                      onTap: () {
                        controller.accountController.text = "";
                      },
                      child: Icon(Icons.close_outlined,
                          size: DoScreenAdapter.fs(18)))),
              onChanged: (value) {
                controller.updateLoginButtonState();
              },
              onSubmitted: (value) {},
            ),
          ),
          SizedBox(height: DoScreenAdapter.h(10)),
          Obx(
            () => Container(
              alignment: Alignment.center,
              height: DoScreenAdapter.h(50),
              padding: EdgeInsets.only(left: DoScreenAdapter.w(15)),
              decoration: BoxDecoration(
                  color: DoColors.gray249,
                  borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.passwordController,
                      keyboardType: TextInputType.text,
                      cursorColor: DoColors.theme,
                      obscuringCharacter: "*",
                      obscureText: controller.isObscure.value,
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
                        suffixIcon: InkWell(
                            onTap: () {
                              controller.passwordController.text = "";
                            },
                            child: Icon(Icons.close_outlined,
                                size: DoScreenAdapter.fs(18))),
                      ),
                      onChanged: (value) {
                        controller.updateLoginButtonState();
                      },
                      onSubmitted: (value) {},
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.updateObscureState();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: DoScreenAdapter.w(15)),
                      child: Icon(
                          controller.isObscure.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: DoScreenAdapter.fs(18),
                          color: Colors.black38),
                    ),
                  ),
                ],
              ),
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
                    : () async {
                        if (GetUtils.isPhoneNumber(
                            controller.accountController.text)) {
                          if (controller.isCheckedProtocol.value) {
                            FocusScope.of(Get.context!)
                                .requestFocus(FocusNode());
                            // EasyLoading.show();
                            EasyLoading.show(status: "登录中...");
                            ResponseModel response = await controller.login();
                            if (response.success) {
                              // Get.offAllNamed("/tabs",
                              //     arguments: {"initialPage": 4});
                              Get.back(); //替换路由
                              EasyLoading.showSuccess(response.message);
                            } else {
                              EasyLoading.showError(response.message);
                            }
                          } else {
                            EasyLoading.showToast("请先同意协议");
                          }
                        } else {
                          EasyLoading.showError("请输入正确手机号");
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
}
