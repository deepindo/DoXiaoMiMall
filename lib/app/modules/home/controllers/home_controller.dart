import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../models/banner_model.dart';
import '../../../models/category_model.dart';
import '../../../models/goods_model.dart';
import '../../../services/app_network.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  RxBool flag = false.obs;
  RxDouble ratio = 0.0.obs;
  RxList<BannerItemModel> bannerList = <BannerItemModel>[].obs;
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;
  RxList<BannerItemModel> bestBannerList = <BannerItemModel>[].obs;
  RxList<GoodsItemModel> hotGoodsList = <GoodsItemModel>[].obs;
  RxList<GoodsItemModel> goodsList = <GoodsItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    _addScrollListener();
    reuqestData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openScan() async {
    var options = const ScanOptions(
      // restrictFormat: selectedFormats,
      // useCamera: _selectedCamera,
      autoEnableFlash: false,
      android: AndroidOptions(
        aspectTolerance: 0.6,
        useAutoFocus: false,
      ),
      strings: {
        'cancel': "取消",
        'flash_on': "打开闪光灯",
        'flash_off': "关闭闪光灯",
      },
    );

    var result = await BarcodeScanner.scan(options: options);
    print(result.type); // The result type (barcode, cancelled, failed)
    print(result.rawContent); // The barcode content
    print(result.format); // The barcode format (as enum)
    print(result.formatNote);

    EasyLoading.showToast(result.rawContent);
  }

  ///滚动监听
  void _addScrollListener() {
    scrollController.addListener(() {
      // print(scrollController.position.pixels);

      double scrollPixels = scrollController.position.pixels;
      double criticalValue = 40; //这个要判断，什么系统，什么屏幕等，完全不一样，不然有问题
      double delta = scrollPixels / criticalValue;
      ratio.value = delta > 1 ? 1 : (delta < 0 ? 0 : delta);

      //应该是渐变的，不是直接一下变的
      if (scrollPixels > criticalValue && flag.value == false) {
        flag.value = true;
      }

      if (scrollPixels < criticalValue && flag.value == true) {
        flag.value = false;
      }

      update();
    });
  }

  ///下拉刷新
  void onRefresh() {
    reuqestData();
    print("onRefresh");
    refreshController.refreshCompleted();
  }

  ///上拉加载更多
  void onLoad() {
    print("onLoading");
    // _requestGoodsData();//分页
    refreshController.loadComplete();
  }

  void reuqestData() {
    _requestBannerData();
    _requestCategoryData();
    _requestBestBannerData();
    _requestHotGoodsData();
    _requestGoodsData();
    update();
  }

  ///请求顶部banner数据
  void _requestBannerData() async {
    // print("_requestBannerData");
    var data = await DoNetwork().get(bannerPath);
    bannerList.value = BannerModel.fromJson(data).result!;
    // update();
  }

  ///请求热销分类数据
  void _requestCategoryData() async {
    // print("_requestCategoryData");
    var data = await DoNetwork().get(bestCategoryPath);
    categoryList.value = CategoryModel.fromJson(data).result!;
    // update();
  }

  ///请求热销banner数据
  void _requestBestBannerData() async {
    // print("_requestBestBannerData");
    var data = await DoNetwork().get(bestBannerPath);
    bestBannerList.value = BannerModel.fromJson(data).result!;
    // update();
  }

  ///请求热销商品数据
  void _requestHotGoodsData() async {
    // print("_requestHotGoodsData");
    var data = await DoNetwork().get(hotGoodsPath);
    hotGoodsList.value = GoodsModel.fromJson(data).result!;
    // update();
  }

  ///请求瀑布流商品数据
  void _requestGoodsData() async {
    // print("_requestGoodsData");
    var data = await DoNetwork().get(goodsPath);
    goodsList.value = GoodsModel.fromJson(data).result!;
    // update();
  }
}
