import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/banner_model.dart';
import '../../../models/goods_model.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_network.dart';

class MeController extends GetxController {
  RxList<BannerItemModel> bannerList = <BannerItemModel>[].obs;
  RxList<GoodsItemModel> goodsList = <GoodsItemModel>[].obs;

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

  @override
  void onInit() {
    super.onInit();
    _requestBannerData();
    _requestGoodsData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///请求banner数据
  void _requestBannerData() async {
    // print("_requestBannerData");
    var data = await DoNetwork().get(bannerPath);
    bannerList.value = BannerModel.fromJson(data).result!;
    update();
  }

  ///请求瀑布流商品数据
  void _requestGoodsData() async {
    // print("_requestGoodsData");
    var data = await DoNetwork().get(goodsPath);
    goodsList.value = GoodsModel.fromJson(data).result!;
    update();
  }
}
