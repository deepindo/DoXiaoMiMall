import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../components/app_components.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../../../../models/response_model.dart';
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
                              size: DoScreenAdapter.fs(18)),
                        ),
                      ),
                      onChanged: (value) {
                        controller.updateRegisterButtonState();
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
                      controller: controller.confirmPasswordController,
                      keyboardType: TextInputType.text,
                      cursorColor: DoColors.theme,
                      obscureText: controller.isConfrimObscure.value,
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
                        suffixIcon: InkWell(
                            onTap: () {
                              controller.confirmPasswordController.text = "";
                            },
                            child: Icon(Icons.close_outlined,
                                size: DoScreenAdapter.fs(18))),
                      ),
                      onChanged: (value) {
                        controller.updateRegisterButtonState();
                      },
                      onSubmitted: (value) {},
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.updateConfirmObscureState();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: DoScreenAdapter.w(15)),
                      child: Icon(
                          controller.isConfrimObscure.value
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
                        if (controller.passwordController.text !=
                            controller.confirmPasswordController.text) {
                          EasyLoading.showError("两次密码不一致");
                        } else if (controller.passwordController.text.length <
                            8) {
                          EasyLoading.showError("密码小于8位");
                        } else {
                          FocusScope.of(Get.context!).requestFocus(FocusNode());
                          EasyLoading.show(status: "注册中");
                          ResponseModel response = await controller.register();
                          if (response.success) {
                            ///层级太多，用不了替换路由
                            Get.offAllNamed("/tabs",
                                arguments: {"initialPage": 4});
                            // Get.back(); //替换路由
                            EasyLoading.showSuccess(response.message);
                          } else {
                            EasyLoading.showError(response.message);
                          }
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
