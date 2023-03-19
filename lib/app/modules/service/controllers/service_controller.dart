import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/app_colors.dart';

class ServiceController extends GetxController {
  ///服务列表
  List<Map> serviceList = [
    {
      "uniId": "s0",
      "icon": Icons.ac_unit_outlined,
      "color": Colors.blue,
      "title": "我要安装"
    },
    {
      "uniId": "s1",
      "icon": Icons.access_alarm,
      "color": Colors.purple,
      "title": "我要维修"
    },
    {
      "uniId": "s2",
      "icon": Icons.accessibility_new,
      "color": DoColors.theme,
      "title": "我要退换"
    },
    {
      "uniId": "s3",
      "icon": Icons.account_tree,
      "color": DoColors.theme,
      "title": "服务进度"
    },
    {
      "uniId": "s4",
      "icon": Icons.send_and_archive,
      "color": Colors.green,
      "title": "以旧换新"
    },
    {
      "uniId": "s5",
      "icon": Icons.precision_manufacturing,
      "color": Colors.green,
      "title": "维修价格"
    },
    {
      "uniId": "s6",
      "icon": Icons.design_services_outlined,
      "color": DoColors.theme,
      "title": "我要贴膜"
    },
    {
      "uniId": "s7",
      "icon": Icons.ac_unit_outlined,
      "color": Colors.green,
      "title": "全服服务"
    },
  ];

  List questionList = [
    {"uniId": "q1", "title": "售后申请如何取消或修改"},
    {"uniId": "q1", "title": "如何申请售后"},
    {"uniId": "q1", "title": "小米售后服务政策"},
    {"uniId": "q1", "title": "小米产品有货时间"},
    {"uniId": "q1", "title": "售后快递费报销吗"},
  ];

  final count = 0.obs;
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
  }

  void increment() => count.value++;
}
