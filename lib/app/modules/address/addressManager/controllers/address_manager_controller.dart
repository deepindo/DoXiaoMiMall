import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../models/address_model.dart';
import '../../../../models/user_model.dart';
import '../../../../services/app_network.dart';
import '../../../../services/app_signService.dart';
import '../../../../services/app_userService.dart';

class AddressManagerController extends GetxController {
  RxList<AddressItemModel> addressList = <AddressItemModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    requestAddressList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///请求地址列表
  void requestAddressList() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});

      ///get与post没有兼容，只能用get
      // String path = addressListPath + "?uid=${model.sId}&sign=$sign";
      String path = "api/addressList?uid=${model.sId}&sign=$sign";
      // print(path);
      var data = await DoNetwork().get(path);
      addressList.value = AddressModel.fromJson(data).result!;
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
          requestAddressList();
        } else {
          EasyLoading.showError(data["message"]);
        }
      } else {
        EasyLoading.showError(data["请求失败"]);
      }
      update();
    }
  }

  ///删除收货地址
  void deleteAddress(String addressId) async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      EasyLoading.show();
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId, "id": addressId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});

      var data = await DoNetwork()
          .post(deleteAddressPath, data: {...jsonMap, "sign": sign});
      if (data != null) {
        if (data["success"]) {
          EasyLoading.showSuccess(data["message"]);
          requestAddressList();
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
