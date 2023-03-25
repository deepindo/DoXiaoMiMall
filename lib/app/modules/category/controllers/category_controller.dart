import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../models/category_model.dart';
import '../../../services/app_network.dart';

class CategoryController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  RxInt selectIndex = 0.obs;
  RxList<CategoryItemModel> leftCategoryList = <CategoryItemModel>[].obs;
  RxList<CategoryItemModel> rightCategoryList = <CategoryItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _requestLeftCategoryData();
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
    _requestLeftCategoryData();
  }

  void changeIndex(index, id) {
    selectIndex.value = index;
    _requestRightCategoryData(id);
    update();
  }

  void _requestLeftCategoryData() async {
    // print("_requestLeftCategoryData");
    var data = await DoNetwork().get(mainCategoryPath);
    leftCategoryList.value = CategoryModel.fromJson(data).result!;
    _requestRightCategoryData(leftCategoryList[0].sId!); //这是首次初始化，也可以直接指定为0
    refreshController.refreshCompleted();
    update();
  }

  void _requestRightCategoryData(String id) async {
    // print("_requestRightCategoryData");
    var data = await DoNetwork().get(secondCategoryPath + id);
    rightCategoryList.value = CategoryModel.fromJson(data).result!;
    update();
  }
}
