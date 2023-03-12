import 'package:get/get.dart';
import '../../../models/goods_model.dart';
import '../../../services/app_network.dart';

class GoodsListController extends GetxController {
  RxInt page = 1.obs;
  int pageSize = 10;
  RxList<GoodsItemModel> goodsList = <GoodsItemModel>[].obs;
  @override
  void onInit() {
    super.onInit();

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

  ///请求商品列表数据
  void _requestGoodsListData() async {
    print("_requestGoodsListData");
    String fullPath = goodsListPath +
        "${page.value}&pageSize=${pageSize}&cid=${Get.arguments["cid"]}";
    print("fullPath---${fullPath}");
    var data = await DoNetwork().get(fullPath);
    goodsList.value = GoodsModel.fromJson(data).result!;
    update();
  }
}
