import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../models/category_model.dart';

class CategoryController extends GetxController {
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

  void changeIndex(index, id) {
    selectIndex.value = index;
    _requestRightCategoryData(id);
    update();
  }

  void _requestLeftCategoryData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/pcate/");
    // print(response);
    leftCategoryList.value = CategoryModel.fromJson(response.data).result!;
    // _requestRightCategoryData(categoryList[selectIndex.value].sId!);
    _requestRightCategoryData(leftCategoryList[0].sId!); //这是首次初始化，也可以直接指定为0
    update();
  }

  void _requestRightCategoryData(String id) async {
    var response =
        await Dio().get("https://xiaomi.itying.com/api/pcate?pid=$id");
    // print(response);
    rightCategoryList.value = CategoryModel.fromJson(response.data).result!;
    update();
  }
}
