import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxList<Widget> tabBarList = const [
    Tab(text: "全部"),
    Tab(text: "待付款"),
    Tab(text: "待收货"),
    Tab(text: "待评价")
  ].obs;

  final List<Widget> tabControllerChildrenList = [
    // ListView(
    //   children: _initListData(),
    // ),
    const Text("333"),
    const Text("444"),
    const Text("55"),
    const Text("6"),
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: tabBarList.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
