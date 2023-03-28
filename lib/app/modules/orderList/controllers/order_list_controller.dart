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
  int initialIndex = Get.arguments != null ? Get.arguments["initialIndex"] : 0;

  ///tab标签列表
  RxList<Widget> tabBarList = const [
    Tab(text: "全部"),
    Tab(text: "待付款"),
    Tab(text: "待收货"),
    Tab(text: "待评价")
  ].obs;

  ///所有订单列表
  RxList<OrderItemModel> allOrderList = <OrderItemModel>[].obs;
  RxList<OrderItemModel> paymentOrderList = <OrderItemModel>[].obs;
  RxList<OrderItemModel> receiverOrderList = <OrderItemModel>[].obs;
  RxList<OrderItemModel> commentOrderList = <OrderItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    initialPage();
    addTabControllerListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  ///初始化页面
  void initialPage() {
    tabController = TabController(
        length: tabBarList.length, vsync: this, initialIndex: initialIndex);
    switch (initialIndex) {
      case 0:
        requestAllOrderList();
        break;
      case 1:
        requestOrderList(1);
        break;
      case 2:
        requestOrderList(2);
        break;
      case 3:
        requestOrderList(3);
        break;
      default:
    }
  }

  void addTabControllerListener() {
    tabController.addListener(() {
      //滚动&点击切换都可以监听
      if (tabController.animation!.value == tabController.index) {
        ///执行请求？
        print("addListener-${tabController.index}");
        requestOrderList(tabController.index);
      }
    });
  }

  void tapToChangeIndex() {
    print("tapToChangeIndex");
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
      allOrderList.value = OrderModel.fromJson(data).result!;
      update();
    }
  }

  ///通用请求
  ///暂时接口不生效
  void requestOrderList(int index) async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});
      String path =
          "api/orderList?uid=${model.sId}&order_status=index&sign=$sign";
      // print("----${path}");
      var data = await DoNetwork().get(path);
      List<OrderItemModel>? tempList = OrderModel.fromJson(data).result!;
      switch (index) {
        case 0:
          allOrderList.value = tempList;
          break;
        case 1:
          paymentOrderList.value = tempList;
          break;
        case 2:
          // receiverOrderList.value = tempList;
          break;
        case 3:
          // commentOrderList.value = tempList;
          break;
        default:
      }

      update();
    }
  }
}
