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
    {"id": 3, "title": "新品优先"},
    {"id": 4, "title": "筛选"},
  ];
  RxInt selectHeaderId = 0.obs;
  RxInt currentHeaderSort = 0.obs;
  String sortFields = "";

  @override
  void onInit() {
    super.onInit();

    _addScrollControllerListener();
    // _requestGoodsListData();
    // onRefresh();
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
    // print("onRefresh");

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

  void openSortPrice() {
    isOpenSortPrice.value = true;
    update();
  }

  void closeSortPrice() {
    isOpenSortPrice.value = false;
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

  void _addScrollControllerListener() {
    scrollController.addListener(() {
      ///滚动距离接近
      // if (scrollController.position.pixels >
      //     scrollController.position.maxScrollExtent - 30) {
      //   ///加载下一页
      //   _requestGoodsListData();
      // }
    });
  }

/*
  ///请求商品列表数据
  void _requestGoodsListData() async {
    if (flag && isHaveData.value) {
      flag = false;
      print("_requestGoodsListData");

      ///cid与search字段没有做兼容，不能完整拼在一起，得分开传
      /// String fullPath = "api/plist?pageSize=${pageSize}&page=${page}&cid=${cid}&search=${searchWords}";
      if (cid != null) {
        fullPath =
            "api/plist?pageSize=$pageSize&page=$page&cid=$cid&sort=$sortFields";
      }

      if (searchWords != null) {
        fullPath =
            "api/plist?pageSize=$pageSize&page=$page&search=$searchWords&sort=$sortFields";
      }

      print("fullPath---$fullPath");

      var data = await DoNetwork().get(fullPath);
      // goodsList.value = GoodsModel.fromJson(data).result!;
      ///采用分页加载
      goodsList.addAll(GoodsModel.fromJson(data).result!);

      update();

      flag = true;
      page++;

      ///当前这次请求的数据小于一页的数据，则证明没有数据了
      if (GoodsModel.fromJson(data).result!.length < pageSize) {
        isHaveData.value = false;
      }
    }
  }
*/
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
    print("fullPath---$fullPath");

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
