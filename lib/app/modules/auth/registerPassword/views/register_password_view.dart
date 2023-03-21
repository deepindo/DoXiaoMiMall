import 'package:doxiaomimall/app/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/app_components.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../../../../services/app_network.dart';
import '../controllers/register_password_controller.dart';

class RegisterPasswordView extends GetView<RegisterPasswordController> {
  const RegisterPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('手机号快速注册'),
        centerTitle: true,
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
              keyboardType: TextInputType.text,
              obscureText: true,
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
                controller.updateRegisterButtonState();
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
              controller: controller.confirmPasswordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              style: TextStyle(
                  color: DoColors.black0,
                  fontSize: DoScreenAdapter.fs(16),
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "确认密码",
                  hintStyle: TextStyle(
                      color: DoColors.gray168,
                      fontSize: DoScreenAdapter.fs(16),
                      fontWeight: FontWeight.bold),
                  suffixIcon:
                      Icon(Icons.close_outlined, size: DoScreenAdapter.fs(18))),
              onChanged: (value) {
                controller.updateRegisterButtonState();
              },
              onSubmitted: (value) {},
            ),
          ),
          SizedBox(height: DoScreenAdapter.h(20)),
          Obx(
            () => ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(DoScreenAdapter.w(20)))),
                    backgroundColor: MaterialStateProperty.all(
                        controller.isRegisterButtonEnable.value
                            ? DoColors.theme
                            : DoColors.yellow253),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: !controller.isRegisterButtonEnable.value
                    ? null
                    : () async {
                        if (controller.passwordController.text ==
                            controller.confirmPasswordController.text) {
                          if (controller.passwordController.text.length >= 8) {
                            FocusScope.of(Get.context!)
                                .requestFocus(FocusNode());
                            print(controller.phone);
                            print(controller.code);
                            print(controller.passwordController.text);
                            ResponseModel response =
                                await controller.register();
                            if (response.success) {
                              Get.offAllNamed("/tabs");
                              Get.snackbar("提示", "注册成功");

                              ///将数据写入本地
                              ///
                            } else {
                              Get.snackbar("提示", response.message);
                            }
                          } else {
                            Get.snackbar("提示", "密码小于8位");
                          }
                        } else {
                          Get.snackbar("提示", "两次密码不一致");
                        }
                      },
                child: Text("完成注册",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(14),
                        fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    );
  }
}
