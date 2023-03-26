import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../models/user_model.dart';
import '../../../../services/app_network.dart';
import '../../../../services/app_signService.dart';
import '../../../../services/app_userService.dart';
import '../../addressManager/controllers/address_manager_controller.dart';

class AddressModifyController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressDistrictController = TextEditingController();
  TextEditingController addressDetailController = TextEditingController();
  TextEditingController pasteController = TextEditingController();
  RxBool isAddressDefault = false.obs;

  @override
  void onInit() {
    super.onInit();
    initEditingControllerContent();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    Get.find<AddressManagerController>().requestAddressList();
  }

  ///初始化上个页面传过来的值
  void initEditingControllerContent() {
    usernameController.text = Get.arguments["name"];
    phoneController.text = Get.arguments["phone"];

    ///对地址内容做处理
    String fullAddress = Get.arguments["address"];
    List list = fullAddress.split(" ");
    addressDistrictController.text = "${list[0]} ${list[1]} ${list[2]}";
    list.removeRange(0, 3);
    addressDetailController.text = list.join(" ");
  }

  ///改变是否是默认switch
  void switchDefault() {
    isAddressDefault.value = !isAddressDefault.value;
    update();
  }

  ///修改地址
  void modifyAddress() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      EasyLoading.show();
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {
        "uid": model.sId,
        "id": Get.arguments["sId"],
        "name": usernameController.text,
        "phone": phoneController.text,
        "address":
            "${addressDistrictController.text} ${addressDetailController.text}"
      };

      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});
      var data = await DoNetwork()
          .post(modifyAddressPath, data: {...jsonMap, "sign": sign});
      if (data != null) {
        if (data["success"]) {
          Get.back();
          EasyLoading.showSuccess(data["message"]);
        } else {
          EasyLoading.showError(data["message"]);
        }
      } else {
        EasyLoading.showError("请求失败");
      }
    }
  }

  ///删除收货地址
  void deleteAddress() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      EasyLoading.show();
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId, "id": Get.arguments["addressId"]};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});

      var data = await DoNetwork()
          .post(deleteAddressPath, data: {...jsonMap, "sign": sign});
      if (data != null) {
        if (data["success"]) {
          Get.back();
          EasyLoading.showSuccess(data["message"]);
        } else {
          EasyLoading.showError(data["message"]);
        }
      } else {
        EasyLoading.showError(data["请求失败"]);
      }
      update();
    }
  }
}
