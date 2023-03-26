import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../models/user_model.dart';
import '../../../../services/app_network.dart';
import '../../../../services/app_userService.dart';
import '../../../../services/app_signService.dart';
import '../../../checkout/controllers/checkout_controller.dart';
import '../../addressManager/controllers/address_manager_controller.dart';

class AddressCreateController extends GetxController {
  // final AddressManagerController controller = Get.find();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressDistrictController = TextEditingController();
  TextEditingController addressDetailController = TextEditingController();
  TextEditingController pasteController = TextEditingController();
  RxBool isAddressDefault = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    // controller.requestAddressList();
    Get.find<CheckoutController>().requestDefaultAddress();
    Get.find<CheckoutController>().requestAllAddressList();

    Get.find<AddressManagerController>().requestAddressList();
  }

  ///改变是否是默认switch
  void switchDefault() {
    isAddressDefault.value = !isAddressDefault.value;
    update();
  }

  ///添加地址
  void createAddress() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      EasyLoading.show();
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {
        "uid": model.sId,
        "name": usernameController.text,
        "phone": phoneController.text,
        "address":
            "${addressDistrictController.text} ${addressDetailController.text}"
      };

      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});
      var data = await DoNetwork()
          .post(createAddressPath, data: {...jsonMap, "sign": sign});
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
    // else {
    //   EasyLoading.showError("获取用户信息失败");
    // }
  }
}
