import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/goods_model.dart';
import '../../../services/app_network.dart';

class GoodsListController extends GetxController {
  RxInt selectButtonIndex = 0.obs;
  // RxInt page = 1.obs;
  int page = 1;
  int pageSize = 10;

  bool flag = true;
  RxBool isHaveData = true.obs;

  ///接收参数
  String? cid = Get.arguments["cid"];
  String? searchWords = Get.arguments["searchWords"];
  String fullPath = "";

  RxList<GoodsItemModel> goodsList = <GoodsItemModel>[].obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    _addScrollControllerListener();
    _requestGoodsListData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void _changeSelectButtonIndex(int index) {
  //   selectButtonIndex.value = index;
  //   update();
  // }

  void _addScrollControllerListener() {
    scrollController.addListener(() {
      ///滚动距离接近
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 30) {
        ///加载下一页
        _requestGoodsListData();
      }
    });
  }

  ///请求商品列表数据
  void _requestGoodsListData() async {
    if (flag && isHaveData.value) {
      flag = false;
      print("_requestGoodsListData");

      ///cid与search字段没有做兼容，不能完整拼在一起，得分开传
      /// String fullPath = "api/plist?pageSize=${pageSize}&page=${page}&cid=${cid}&search=${searchWords}";
      if (cid != null) {
        fullPath = "api/plist?pageSize=${pageSize}&page=${page}&cid=${cid}";
      }

      if (searchWords != null) {
        fullPath =
            "api/plist?pageSize=${pageSize}&page=${page}&search=${searchWords}";
      }

      print("fullPath---${fullPath}");

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
}
