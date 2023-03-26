import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/response_model.dart';
import '../../../../models/user_model.dart';
import '../../../../services/app_network.dart';
import '../../../../services/app_userService.dart';
import '../../../../services/app_signService.dart';
import '../../addressManager/controllers/address_manager_controller.dart';

class AddressCreateController extends GetxController {
  final AddressManagerController controller = Get.find();
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
    controller.requestAddressList();
  }

  void changeDefaultAddress() {
    isAddressDefault.value = !isAddressDefault.value;
    update();
  }

  void setAddressDistrict() {}

  Future<ResponseModel> addressCreate() async {
    // if (usernameController.text.isEmpty) {
    //   EasyLoading.showToast("请填写完整的姓名");
    // } else if (!GetUtils.isPhoneNumber(phoneController.text) ||
    //     phoneController.text.length != 11) {
    //   EasyLoading.showToast("请填写正确的手机号");
    // } else if (addressDistrictController.text.length < 2) {
    //   EasyLoading.showToast("请选择地区");
    // } else if (addressDetailController.text.length < 2) {
    //   EasyLoading.showToast("请填写详细地址");
    // } else {
    // FocusScope.of(Get.context!).requestFocus(FocusNode());
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
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
          .post(addressCreatePath, data: {...jsonMap, "sign": sign});
      if (data != null) {
        if (data["success"]) {
          return ResponseModel(success: true, message: data["message"]);
        } else {
          return ResponseModel(success: false, message: data["message"]);
        }
      } else {
        return ResponseModel(success: false, message: "请求失败");
      }
    } else {
      return ResponseModel(success: false, message: "获取用户信息失败");
    }
  }
}
