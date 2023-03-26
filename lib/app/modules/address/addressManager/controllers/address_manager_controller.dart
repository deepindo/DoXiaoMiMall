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

  void requestAddressList() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      // EasyLoading.show(status: "加载中...");
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId};

      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});

      ///get与post没有兼容，只能用get
      // String path = addressListPath + "?uid=${model.sId}&sign=$sign";
      String path = "api/addressList?uid=${model.sId}&sign=$sign";
      print(path);
      var data =
          await DoNetwork().get("api/addressList?uid=${model.sId}&sign=$sign");
      addressList.value = AddressModel.fromJson(data).result!;
      update();

      // print(data);
      // if (data != null) {
      //   if (data["success"]) {
      //     // Get.back();
      //     EasyLoading.showSuccess(data["message"]);
      //   } else {
      //     EasyLoading.showError(data["message"]);
      //   }
      // } else {
      //   EasyLoading.showError("请求失败");
      // }
    }
  }
}
