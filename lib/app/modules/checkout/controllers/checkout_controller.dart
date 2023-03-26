import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../models/address_model.dart';
import '../../../models/user_model.dart';
import '../../../services/app_network.dart';
import '../../../services/app_signService.dart';
import '../../../services/app_userService.dart';

class CheckoutController extends GetxController {
  List checkoutList =
      Get.arguments != null ? Get.arguments["checkoutList"] : [];
  RxList<AddressItemModel> defaultAddressList = <AddressItemModel>[].obs;
  RxList<AddressItemModel> allAddressList = <AddressItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    requestDefaultAddress();
    requestAllAddressList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///请求默认收货地址
  void requestDefaultAddress() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});

      String path = "api/oneAddressList?uid=${model.sId}&sign=$sign";
      var data = await DoNetwork().get(path);
      defaultAddressList.value = AddressModel.fromJson(data).result!;
      update();
    }
  }

  ///请求所有收货地址
  void requestAllAddressList() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});
      String path = "api/addressList?uid=${model.sId}&sign=$sign";

      var data = await DoNetwork().get(path);
      allAddressList.value = AddressModel.fromJson(data).result!;
      update();
    }
  }

  ///修改默认收货地址
  void modifyDefaultAddress(String addressId) async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      EasyLoading.show();
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId, "id": addressId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});

      var data = await DoNetwork()
          .post(modifyDefaultAddressPath, data: {...jsonMap, "sign": sign});
      if (data != null) {
        if (data["success"]) {
          EasyLoading.showSuccess(data["message"]);
          requestDefaultAddress();
          requestAllAddressList();
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
