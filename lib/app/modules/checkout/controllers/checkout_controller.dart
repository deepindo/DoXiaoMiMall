import 'package:get/get.dart';
import '../../../models/address_model.dart';
import '../../../models/user_model.dart';
import '../../../services/app_network.dart';
import '../../../services/app_signService.dart';
import '../../../services/app_userService.dart';

class CheckoutController extends GetxController {
  List checkoutList =
      Get.arguments != null ? Get.arguments["checkoutList"] : [];
  RxList<AddressItemModel> addressList = <AddressItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    requestDefaultAddress();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void requestDefaultAddress() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});

      String path = "api/oneAddressList?uid=${model.sId}&sign=$sign";
      var data = await DoNetwork().get(path);
      addressList.value = AddressModel.fromJson(data).result!;
      update();
    }
  }
}
