import 'package:doxiaomimall/app/services/app_cartService.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // RxBool isShowEditingButton = true.obs;
  // RxBool isShowBottomFloatingView = true.obs;
  RxList cartList = [].obs;
  RxBool checkedAllState = true.obs;

  // final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///获取本地购物车数据
  void getLocalCartList() async {
    cartList.value = await DoCartService.getLocalCartList();
    checkedAllState.value = judgeIsCheckedAll()!;
    update();
  }

  ///增加购买数量
  void plusBuyNumber(Map element) async {
    ///假如对数量上限有限制，这里可以添加buyNumber的判断
    if (element["buyNumber"] < 10) {
      element["buyNumber"]++;
      //async&await不能忘记了，否则异步执行顺序有问题
      await DoCartService.updateLocalCartItemBuyNumber(element["sId"],
          element["selectedGoodsAttributes"], element["buyNumber"]);
      // DoCartService.updateLocalCartItemBuyNumber(element["goodsModel"],
      //     element["selectedGoodsAttributes"], element["buyNumber"]);//想要为map的value设置为模型，不行，识别不了
      // getLocalCartList();///不要直接调，里面还有一个update
      cartList.value = await DoCartService.getLocalCartList();
      update();
    } else {
      Get.snackbar("提示", "本商品限购10件！");
    }

    // buyNumber.value++;
    getLocalCartList();
    update();
  }

  ///减少购买数量
  void minusBuyNumber(Map element) async {
    if (element["buyNumber"] > 1) {
      element["buyNumber"]--;
      await DoCartService.updateLocalCartItemBuyNumber(element["sId"],
          element["selectedGoodsAttributes"], element["buyNumber"]);
      cartList.value = await DoCartService.getLocalCartList();
      update();
    } else {
      Get.snackbar("提示", "已经到最低数量了！");
    }
  }

  ///改变选中状态
  void changeCheckboxState(Map element) async {
    await DoCartService.updateLocalCartItemCheckedState(
        element["sId"], element["selectedGoodsAttributes"]);
    cartList.value = await DoCartService.getLocalCartList();
    checkedAllState.value = judgeIsCheckedAll()!;
    update();
  }

  ///改变全选状态
  void changeCheckedAllBoxState(bool? state) async {
    checkedAllState.value = !checkedAllState.value;
    // checkedAllState.value = state!; //用上面的方式不用传值
    await DoCartService.updateLocalCartAllCheckedState(checkedAllState.value);
    cartList.value = await DoCartService.getLocalCartList();
    update();
  }

  ///判断是不是全选
  bool? judgeIsCheckedAll() {
    if (cartList.isNotEmpty) {
      for (var element in cartList) {
        if (element["checked"] == false) {
          return false;
        }
      }
      return true;
    } else {
      return false;
    }
  }

  ///获取已经选中的清单
  List getCheckedList() {
    var tempList = [];
    if (cartList.isNotEmpty) {
      for (var element in cartList) {
        if (element["checked"] == true) {
          tempList.add(element);
        }
      }
    }
    return tempList;
  }
}
