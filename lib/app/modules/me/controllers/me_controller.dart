import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../models/banner_model.dart';
import '../../../models/goods_model.dart';
import '../../../models/user_model.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_network.dart';
import '../../../services/app_userService.dart';

class MeController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  RxList<BannerItemModel> bannerList = <BannerItemModel>[].obs;
  RxList<GoodsItemModel> goodsList = <GoodsItemModel>[].obs;
  RxBool isLogin = false.obs;
  var model = UserModel().obs;

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
    print("*---*>:MeController onInit");
    _requestBannerData();
    _requestGoodsData();
    getUserInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    print("*---*>:MeController onClose");
  }

  @override
  void dispose() {
    super.dispose();
    print("*---*>:MeController dispose");
  }

  ///下拉刷新
  void onRefresh() {
    _requestBannerData();
    _requestGoodsData();
    getUserInfo();
    refreshController.refreshCompleted();
  }

  ///请求banner数据
  void _requestBannerData() async {
    // print("_requestBannerData");
    var data = await DoNetwork().get(bannerPath);
    bannerList.value = BannerModel.fromJson(data).result!;
    refreshController.refreshCompleted();
    update();
  }

  ///请求瀑布流商品数据
  void _requestGoodsData() async {
    // print("_requestGoodsData");
    var data = await DoNetwork().get(goodsPath);
    goodsList.value = GoodsModel.fromJson(data).result!;
    update();
  }

  void getUserInfo() async {
    isLogin.value = await DoUserService.isLogin();

    ///首次运行app，在onInit中调用本函数，此时没有登录，不应该继续进行下面的，否则会报错
    ///Unhandled Exception: RangeError (index): Invalid value: Valid value range is empty: 0
    if (isLogin.value) {
      var data = await DoUserService.getUserInfo();
      if (data != []) {
        // userInfoList.value = data;
        model.value = UserModel.fromJson(data[0]);
        update();
      }
    }
  }

  ///退出登录，最后放到设置里面去
  // void logout() async {
  //   await DoUserService.removeUserInfo();
  //   isLogin.value = await DoUserService.isLogin();
  //   model.value = UserModel();
  //   Get.offAllNamed("/tabs");
  //   update();
  // }
}
