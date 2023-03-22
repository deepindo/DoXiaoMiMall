import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../models/response_model.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../../../../components/app_components.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("手机号快速注册"),
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
          _phoneTextFieldSection(),
          SizedBox(height: DoScreenAdapter.h(20)),
          _protocolSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          _sendCodeButtonSection(),
        ],
      ),
    );
  }

  ///手机号输入区
  Widget _phoneTextFieldSection() {
    return Container(
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
              textAlignVertical: TextAlignVertical.center,
              controller: controller.phoneController,
              keyboardType: TextInputType.number,
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
                  suffixIcon:
                      Icon(Icons.close_outlined, size: DoScreenAdapter.fs(18))),
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
    );
  }

  ///协议区
  Widget _protocolSection() {
    return Obx(
      () => commonProtocolView(
        controller.isCheckedProtocol.value,
        onTap: (selected) {
          controller.isCheckedProtocol.value = selected!;
        },
      ),
    );
  }

  ///发送验证码按钮区
  Widget _sendCodeButtonSection() {
    return Obx(
      () => ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DoScreenAdapter.w(20)))),
              backgroundColor: MaterialStateProperty.all(
                  controller.isSendCodeButtonEnable.value
                      ? DoColors.theme
                      : DoColors.yellow253),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: !controller.isSendCodeButtonEnable.value
              ? null
              : () async {
                  if (GetUtils.isPhoneNumber(controller.phoneController.text)) {
                    //自动收起键盘
                    FocusScope.of(Get.context!).requestFocus(FocusNode());
                    EasyLoading.show(status: "获取中...");
                    ResponseModel response =
                        await controller.requestVerificationCode();
                    if (response.success) {
                      Get.toNamed("/register-code", arguments: {
                        "phone": controller.phoneController.text
                      });
                      EasyLoading.showSuccess(response.message);
                    } else {
                      EasyLoading.showError(response.message);
                    }
                  } else {
                    EasyLoading.showError("请输入正确的手机号");
                  }
                },
          child: Text("获取验证码",
              style: TextStyle(
                  fontSize: DoScreenAdapter.fs(14),
                  fontWeight: FontWeight.bold))),
    );
  }
}
