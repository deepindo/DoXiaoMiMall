import 'package:get/get.dart';
import '../../../models/order_model.dart';
import '../../../models/user_model.dart';
import '../../../services/app_network.dart';
import '../../../services/app_signService.dart';
import '../../../services/app_userService.dart';

class OrderContentController extends GetxController {
  String sId = Get.arguments["sId"];
  RxList<OrderItemModel> orderList = <OrderItemModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    requestOrderContent();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///请求所有订单列表
  void requestOrderContent() async {
    // print("requestOrderContent");
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      UserModel model = UserModel.fromJson(list[0]);
      // print("请求${Get.arguments["sId"]}");
      Map jsonMap = {"uid": model.sId, "id": Get.arguments["sId"]};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});
      String path =
          "api/orderInfo?uid=${model.sId}&id=${Get.arguments["sId"]}&sign=$sign";
      // print("----${path}");
      var data = await DoNetwork().get(path);
      orderList.value = OrderModel.fromJson(data).result!;
      update();
    }
  }
}
