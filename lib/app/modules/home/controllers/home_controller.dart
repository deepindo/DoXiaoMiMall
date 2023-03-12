import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../models/banner_model.dart';
import '../../../models/category_model.dart';
import '../../../models/goods_model.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
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
    _requestBannerData();
    _requestCategoryData();
    _requestBestBannerData();
    _requestHotGoodsData();
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
      // print(scrollController.position.pixels);

      double scrollPixels = scrollController.position.pixels;
      double criticalValue = 40; //这个要判断，什么系统，什么屏幕等，完全不一样，不然有问题
      double delta = scrollPixels / criticalValue;
      ratio.value = delta > 1 ? 1 : (delta < 0 ? 0 : delta);

      //应该是渐变的，不是直接一下变的
      if (scrollController.position.pixels > criticalValue &&
          flag.value == false) {
        flag.value = true;
      }

      if (scrollController.position.pixels < criticalValue &&
          flag.value == true) {
        flag.value = false;
      }

      update();
    });
  }

  void _requestBannerData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/focus/");
    // print(response);
    // bannerList.value = response.data["result"];
    bannerList.value = BannerModel.fromJson(response.data).result!;
    update();
  }

  void _requestCategoryData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/bestCate/");
    // print(response);
    categoryList.value = CategoryModel.fromJson(response.data).result!;
    update();
  }

  void _requestBestBannerData() async {
    var response =
        await Dio().get("https://xiaomi.itying.com/api/focus?position=2");
    // print(response);
    // bannerList.value = response.data["result"];
    bestBannerList.value = BannerModel.fromJson(response.data).result!;
    update();
  }

  void _requestHotGoodsData() async {
    var response = await Dio()
        .get("https://xiaomi.itying.com/api/plist?is_hot=1&pageSize=3");
    // print(response);
    hotGoodsList.value = GoodsModel.fromJson(response.data).result!;
    update();
  }

  void _requestGoodsData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/plist/");
    // print(response);
    goodsList.value = GoodsModel.fromJson(response.data).result!;
    update();
  }
}
