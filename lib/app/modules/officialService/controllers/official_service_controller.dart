import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficialServiceController extends GetxController {
  ///服务列表
  List<Map> serviceList = [
    {
      "title": "购买无忧",
      "list": [
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
          "color": Colors.orange,
          "title": "我要退换"
        },
        {
          "uniId": "s3",
          "icon": Icons.account_tree,
          "color": Colors.orange,
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
          "color": Colors.orange,
          "title": "我要贴膜"
        },
      ]
    },
    {
      "title": "电池服务",
      "list": [
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
          "color": Colors.orange,
          "title": "我要退换"
        },
        {
          "uniId": "s3",
          "icon": Icons.account_tree,
          "color": Colors.orange,
          "title": "服务进度"
        },
      ],
    },
    {
      "title": "手机美容",
      "list": [
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
          "color": Colors.orange,
          "title": "我要退换"
        },
        {
          "uniId": "s3",
          "icon": Icons.account_tree,
          "color": Colors.orange,
          "title": "服务进度"
        },
      ]
    },
    {
      "title": "安装服务",
      "list": [
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
          "color": Colors.orange,
          "title": "我要退换"
        },
        {
          "uniId": "s3",
          "icon": Icons.account_tree,
          "color": Colors.orange,
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
      ]
    },
    {
      "title": "维修服务",
      "list": [
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
          "color": Colors.orange,
          "title": "我要退换"
        },
        {
          "uniId": "s3",
          "icon": Icons.account_tree,
          "color": Colors.orange,
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
      ]
    },
    {
      "title": "保障服务",
      "list": [
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
          "color": Colors.orange,
          "title": "我要退换"
        },
        {
          "uniId": "s3",
          "icon": Icons.account_tree,
          "color": Colors.orange,
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
          "color": Colors.orange,
          "title": "我要贴膜"
        },
      ]
    },
    {
      "title": "清洁保养",
      "list": [
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
          "color": Colors.orange,
          "title": "我要退换"
        },
        {
          "uniId": "s3",
          "icon": Icons.account_tree,
          "color": Colors.orange,
          "title": "服务进度"
        },
        {
          "uniId": "s4",
          "icon": Icons.send_and_archive,
          "color": Colors.green,
          "title": "以旧换新"
        },
      ]
    },
    {
      "title": "勘测服务",
      "list": [
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
      ]
    },
    {
      "title": "更多服务",
      "list": [
        {
          "uniId": "s0",
          "icon": Icons.ac_unit_outlined,
          "color": Colors.blue,
          "title": "企业团购"
        },
        {
          "uniId": "s1",
          "icon": Icons.access_alarm,
          "color": Colors.purple,
          "title": "电视贴膜"
        },
        {
          "uniId": "s2",
          "icon": Icons.accessibility_new,
          "color": Colors.orange,
          "title": "我要退换"
        },
        {
          "uniId": "s3",
          "icon": Icons.account_tree,
          "color": Colors.orange,
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
      ]
    },
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
