import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/order_model.dart';
import '../../../models/user_model.dart';
import '../../../services/app_network.dart';
import '../../../services/app_signService.dart';
import '../../../services/app_userService.dart';

class OrderListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  ///tab标签列表
  RxList<Widget> tabBarList = const [
    Tab(text: "全部"),
    Tab(text: "待付款"),
    Tab(text: "待收货"),
    Tab(text: "待评价")
  ].obs;

  ///所有订单列表
  RxList<OrderItemModel> orderList = <OrderItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: tabBarList.length, vsync: this);
    requestAllOrderList();
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
  void requestAllOrderList() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});
      String path = "api/orderList?uid=${model.sId}&sign=$sign";
      // print("----${path}");
      var data = await DoNetwork().get(path);
      orderList.value = OrderModel.fromJson(data).result!;
      update();
    }
  }
}
