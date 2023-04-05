import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../models/goods_model.dart';
import '../../../services/app_network.dart';

class GoodsListController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ///是否开始价格排序
  RxBool isOpenSortPrice = false.obs;
  RxBool isShowTopSheet = false.obs;
  RxBool isShowCover = false.obs;

  ///分页相关
  int page = 1;
  int pageSize = 10;
  // bool flag = true;
  // RxBool isHaveData = true.obs;

  ///接收参数
  String? cid = Get.arguments["cid"];
  String? searchWords = Get.arguments["searchWords"];

  ///根据不同参数拼接的不同的路径
  String fullPath = "";

  ///商品列表
  RxList<GoodsItemModel> goodsList = <GoodsItemModel>[].obs;

  ///二级菜单相关
  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();
  List headerMapList = [
    {"id": 0, "title": "综合", "fields": "all", "sort": -1},
    {"id": 1, "title": "销量", "fields": "salecount", "sort": -1},
    {"id": 2, "title": "价格", "fields": "price", "sort": -1},
    {"id": 3, "title": "显卡类型"}, //新品优先
    {"id": 4, "title": "筛选"},
  ];
  RxInt selectHeaderId = 0.obs;
  RxInt currentHeaderSort = 0.obs;
  String sortFields = "";

  ///drawer中过滤字段
  List<Map> filterWordsList = [
    {
      "title": "服务与折扣",
      "unfold": false,
      "list": [
        {"uniId": "s0", "title": "促销"},
        {"uniId": "s1", "title": "分期"},
        {"uniId": "s2", "title": "仅看有货"}
      ]
    },
    {
      "title": "分类",
      "unfold": false,
      "list": [
        {"uniId": "s0", "title": "红米笔记本"},
        {"uniId": "s1", "title": "电池更换服务"},
        {"uniId": "s2", "title": "小米笔记本"},
        {"uniId": "s3", "title": "显示器"},
        {"uniId": "s4", "title": "贴纸"},
        {"uniId": "s5", "title": "笔记本主板维修服务"},
        {"uniId": "s6", "title": "笔记本清洁保养服务"},
        {"uniId": "s7", "title": "电脑包"},
      ]
    },
    {
      "title": "屏幕尺寸",
      "unfold": false,
      "list": [
        {"uniId": "s0", "title": "较大屏幕"},
        {"uniId": "s1", "title": "中等屏幕"},
        {"uniId": "s2", "title": "23.8英寸"},
        {"uniId": "s3", "title": "21.45英寸"},
        {"uniId": "s4", "title": "27英寸"},
      ]
    },
    {
      "title": "显卡类型",
      "unfold": false,
      "list": [
        {"uniId": "s0", "title": "集显"},
        {"uniId": "s1", "title": "NVIDIA GeForce"},
        {"uniId": "s2", "title": "RTX2050"},
        {"uniId": "s3", "title": "RTX3050"},
        {"uniId": "s4", "title": "RTX3060"},
        {"uniId": "s5", "title": "RTX3050 Ti"},
        {"uniId": "s6", "title": "MX550"},
        {"uniId": "s7", "title": "AMD Radeon G"},
        {"uniId": "s8", "title": "Intel Iris Gra"}
      ]
    },
    {
      "title": "内存容量",
      "unfold": false,
      "list": [
        {"uniId": "s0", "title": "超大内存"},
      ]
    },
    {
      "title": "屏幕分辨率",
      "unfold": false,
      "list": [
        {"uniId": "s0", "title": "3200x2000"},
        {"uniId": "s1", "title": "2560x1600"},
        {"uniId": "s2", "title": "2800x1800"},
        {"uniId": "s3", "title": "3840x2400"},
        {"uniId": "s4", "title": "3456x2160"}
      ]
    },
    {
      "title": "固态硬盘",
      "unfold": false,
      "list": [
        {"uniId": "s0", "title": "512GB"},
        {"uniId": "s1", "title": "512GB PCIe SSD"}
      ]
    },
    {
      "title": "电池容量",
      "unfold": false,
      "list": [
        {"uniId": "s0", "title": "56Wh"},
        {"uniId": "s1", "title": "72Wh"},
        {"uniId": "s2", "title": "55.02Wh"},
        {"uniId": "s3", "title": "70Wh"},
        {"uniId": "s4", "title": "80Wh"},
      ]
    },
  ];

  @override
  void onInit() {
    super.onInit();
    requestData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///下拉刷新
  void onRefresh() {
    ///重置
    page = 1;
    // isHaveData.value = true;
    goodsList.value = [];
    // scrollController.jumpTo(0);
    refreshController.loadComplete();

    ///设置此状态，则可以重新上拉，相当于重置

    ///请求数据
    requestData();

    ///设置下拉刷新完成
    refreshController.refreshCompleted();
  }

  ///上拉加载更多
  void onLoad() {
    // print("onLoading${isHaveData.value}");
    // if (isHaveData.value) {
    // print("onLoading");

    ///请求数据
    requestData();

    // print("异步的，这个loadComplete比上面请求数据先执行");
    ///设置上拉加载完成
    // refreshController.loadComplete();
    // }
  }

  ///点击条件筛选展开按钮
  void unfoldFilter(int index) {
    filterWordsList[index]["unfold"] = !filterWordsList[index]["unfold"];
    update();
  }

  ///打开价格排序
  void openSortPrice() {
    isOpenSortPrice.value = true;
    update();
  }

  ///关闭价格排序
  void closeSortPrice() {
    isOpenSortPrice.value = false;
    update();
  }

  void showTopSheet() {
    isShowTopSheet.value = !isShowTopSheet.value;
    update();
  }

  void showTopSheetCover() {
    isShowCover.value = !isShowCover.value;
    update();
  }

  ///点击header不同文字
  void changeHeaderId(int id) {
    selectHeaderId.value = id;
    // if (id == 4) {
    //   scaffoldGlobalKey.currentState!.openEndDrawer();
    // } else if (id == 3) {
    //   ///暂不处理，没有接口
    // } else {
    ///根据点击的拼接排序字段
    sortFields = "${headerMapList[id]["fields"]}_${headerMapList[id]["sort"]}";

    ///通过乘以-1，来切换排序字段也是可以的
    headerMapList[id]["sort"] = headerMapList[id]["sort"] * -1;
    currentHeaderSort.value = headerMapList[id]["sort"];

/*
      ///各变量重置
      page = 1;
      isHaveData.value = true;
      goodsList.value = [];
      scrollController.jumpTo(0);

      /// 重新请求
      _requestGoodsListData();
      */
    //直接执行
    onRefresh();
    // }
    update();
  }

  ///请求数据的方法
  void requestData() async {
    if (cid != null) {
      fullPath =
          "api/plist?pageSize=$pageSize&page=$page&cid=$cid&sort=$sortFields";
    }

    if (searchWords != null) {
      fullPath =
          "api/plist?pageSize=$pageSize&page=$page&search=$searchWords&sort=$sortFields";
    }
    // print("fullPath---$fullPath");

    var data = await DoNetwork().get(fullPath);
    goodsList.addAll(GoodsModel.fromJson(data).result!);
    update();

    ///加页
    page++;

    ///设置没有下页状态，理论应该是控件带的才对
    ///当前这次请求的数据小于一页的数据，则证明没有数据了
    if (GoodsModel.fromJson(data).result!.length < pageSize) {
      // isHaveData.value = false;
      // print("没有数据了");
      refreshController.loadNoData();
    } else {
      // print("还有数据");
      refreshController.loadComplete();
    }
  }
}
