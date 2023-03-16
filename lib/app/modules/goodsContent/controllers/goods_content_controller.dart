import 'dart:async';

import 'package:doxiaomimall/app/models/goods_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../services/app_network.dart';
import '../../../models/goods_content_model.dart';
import '../../../services/app_screenAdapter.dart';
import '../../../models/goods_model.dart';

class GoodsContentController extends GetxController {
  final ScrollController scrollController = ScrollController();

  var cid = Get.arguments["cid"];
  var model = GoodsContentInfoModel().obs;
  RxList<GoodsItemModel> goodsList = <GoodsItemModel>[].obs;

  GlobalKey gk0 = GlobalKey(); //商品页
  GlobalKey gk1 = GlobalKey(); //详情页
  GlobalKey gk2 = GlobalKey(); //推荐页

  double rb1Positon = 0.0;
  double rb2Positon = 0.0;

  List tabsList = [
    {"id": 0, "title": "商品"},
    {"id": 1, "title": "详情"},
    {"id": 2, "title": "推荐"}
  ];
  RxInt selectedTabsIndex = 0.obs; //默认三个
  RxDouble opacity = 0.0.obs;
  RxBool showTabs = false.obs; //默认不显示tabs

  List<Map> paramteterList = [
    {"id": 0, "title": "CPU", "sub_title": "天玑8100", "icon": ""},
    {"id": 1, "title": "三摄像头", "sub_title": "6400万像素", "icon": ""},
    {"id": 2, "title": "超大屏", "sub_title": "6.6英寸", "icon": ""},
    {"id": 3, "title": "屏幕分辨率", "sub_title": "2460x1080", "icon": ""},
    {"id": 4, "title": "极速畅玩", "sub_title": "最高12GB", "icon": ""},
    {"id": 5, "title": "存储容量", "sub_title": "最高512GB", "icon": ""},
    {"id": 6, "title": "普通厚度", "sub_title": "8.87mm", "icon": ""},
    {"id": 7, "title": "超长待机", "sub_title": "5080mAh", "icon": ""},
    {"id": 8, "title": "运营商类型", "sub_title": "5G全网通", "icon": ""},
    {"id": 9, "title": "网络模式", "sub_title": "双卡双待", "icon": ""},
  ];

  List subTabsList = [
    {"id": 0, "title": "商品介绍"},
    {"id": 1, "title": "规格参数"},
    // {"id": 2, "title": "安装须知"},
  ];
  RxInt selectedSubTabsIndex = 0.obs; //二级标题，可能是两个，可能是
  RxBool showSubTabs = false.obs; //默认不显示tabs

  @override
  void onInit() {
    super.onInit();
    _addScrollListener();
    _requestGoodsContentData();
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

  void _addScrollListener() {
    scrollController.addListener(() {
      double scrollPixels = scrollController.position.pixels;
      double criticalValue = 100; //这个要判断，什么系统，什么屏幕等，完全不一样，不然有问题
      double delta = scrollPixels / criticalValue;

      ///临时改为0.4方便查看背景
      opacity.value = delta > 1 ? 1 : (delta < 0 ? 0 : delta);

      // print("scrollPixels---$scrollPixels");

      ///tabs的显示与appBar不一样，不是渐变的，是突然显示的，
      ///但同时不是以完整的临界值criticalValue来比较的，目前按一半来
      // double tabsDelta = scrollPixels / (criticalValue * 0.5);
      // showTabs.value = tabsDelta > 1 ? true : false;
      ///一级标题的显示与否
      showTabs.value = scrollPixels > (criticalValue * 0.5) ? true : false;
      // print("showTabs.value--${showTabs.value}");

      ///
      ///渲染完成，滚动的时候再来获取位置
      ///这个应该是有问题的，比如第二部分两个或者三个二级标签切换，
      ///--------！！！！！而切换后的内容长度不一样，应该是会出现问题的-----------
      ///而且有关rb1Positon && rb2Positon获取也是有问题的，不稳定，以后再找方法
      ///
      if (rb1Positon == 0 && rb2Positon == 0) {
        ///理论上只执行一次，为何方法内部的打印一直在执行
        print("只执行一次：scrollPixels---$scrollPixels");
        _getRenderBoxPosition(scrollPixels);
      }

      ///二级标题的显示与否
      showSubTabs.value =
          (scrollPixels > rb1Positon && scrollPixels < rb2Positon)
              ? true
              : false;

      ///根据临界值和范围，在滚动中自动切换一级标题的选中
      if (scrollPixels > 0 && scrollPixels < rb1Positon) {
        selectedTabsIndex.value = 0;
      } else if (scrollPixels > rb1Positon && scrollPixels < rb2Positon) {
        selectedTabsIndex.value = 1;
      } else if (scrollPixels > rb2Positon) {
        selectedTabsIndex.value = 2;
      } else {}

      update();
    });
  }

  ///获取渲染图层的位置
  void _getRenderBoxPosition(double scrollPixels) {
    double adapterNavHeight = DoScreenAdapter.h(44) + DoScreenAdapter.statush();

    RenderBox rb1 = gk1.currentContext!.findRenderObject() as RenderBox;
    rb1Positon =
        rb1.localToGlobal(Offset.zero).dy + scrollPixels - adapterNavHeight;

    RenderBox rb2 = gk2.currentContext!.findRenderObject() as RenderBox;
    rb2Positon =
        rb2.localToGlobal(Offset.zero).dy + scrollPixels - adapterNavHeight;

    // print("为何一直打印scrollPixels---$scrollPixels");
    // print("rb1Positon-$rb1Positon");
    // print("rb2Positon-$rb2Positon");
  }

  ///请求商品详情页数据
  void _requestGoodsContentData() async {
    // print("_requestGoodsContentData");
    var data = await DoNetwork().get("api/pcontent?id=$cid");
    model.value = GoodsContentModel.fromJson(data).result!;
    update();
  }

  ///请求瀑布流商品数据
  void _requestGoodsData() async {
    // print("_requestGoodsData");
    var data = await DoNetwork().get(goodsPath);
    goodsList.value = GoodsModel.fromJson(data).result!;
    update();
  }

  ///一级标题
  void changeTabsSelectedIndex(int index) {
    selectedTabsIndex.value = index;
    if (index == 0) {
      Scrollable.ensureVisible(gk0.currentContext as BuildContext,
          duration: const Duration(milliseconds: 100));
    } else if (index == 1) {
      Scrollable.ensureVisible(gk1.currentContext as BuildContext,
          duration: const Duration(milliseconds: 100));

      ///前100ms执行滚动，101ms开始修正一下
      ///感觉这个方法不太稳定
      // Timer.periodic(const Duration(milliseconds: 110), (timer) {
      //   double scrollPixels = scrollController.position.pixels;
      //   double adapterNavHeight =
      //       DoScreenAdapter.h(44) + DoScreenAdapter.statush();
      //   double fixedHeight =
      //       scrollPixels - adapterNavHeight + DoScreenAdapter.h(2);
      //   // + DoScreenAdapter.h(1); //微调一点点

      //   scrollController.jumpTo(fixedHeight);
      //   timer.cancel();
      // });
    } else if (index == 2) {
      Scrollable.ensureVisible(gk2.currentContext as BuildContext,
          duration: const Duration(milliseconds: 100));

      ///前100ms执行滚动，101ms开始修正一下
      ///感觉这个方法不太稳定
      // Timer.periodic(const Duration(milliseconds: 110), (timer) {
      //   double scrollPixels = scrollController.position.pixels;
      //   double adapterNavHeight =
      //       DoScreenAdapter.h(44) + DoScreenAdapter.statush();
      //   double fixedHeight =
      //       scrollPixels - adapterNavHeight + DoScreenAdapter.h(2);
      //   // + DoScreenAdapter.h(1); //微调一点点

      //   scrollController.jumpTo(fixedHeight);
      //   timer.cancel();
      // });
    }
    update();
  }

  ///二级标题
  void changeSubTabsSelectedIndex(int index) {
    selectedSubTabsIndex.value = index;
    scrollController.jumpTo(rb1Positon); //这个是一种实现方式，但与原app有区别，后续有空再实现不同的效果
    update();
  }

  ///已选弹框中的选择标签切换点击
  void changeSelectedTags() {
    update();
  }
}
