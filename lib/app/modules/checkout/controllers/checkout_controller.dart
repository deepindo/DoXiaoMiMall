import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../models/address_model.dart';
import '../../../models/user_model.dart';
import '../../../services/app_network.dart';
import '../../../services/app_signService.dart';
import '../../../services/app_userService.dart';
import '../../../services/app_cartService.dart';
import '../../../modules/cart/controllers/cart_controller.dart';

class CheckoutController extends GetxController {
  List checkoutList =
      Get.arguments != null ? Get.arguments["checkoutList"] : [];
  int checkedTotalCount = Get.arguments["checkedTotalCount"];
  double checkedTotalPrice = Get.arguments["checkedTotalPrice"];
  RxList<AddressItemModel> defaultAddressList = <AddressItemModel>[].obs;
  RxList<AddressItemModel> allAddressList = <AddressItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    requestAddressData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///两个接口一起调用
  void requestAddressData() {
    requestDefaultAddress();
    requestAllAddressList();
  }

  ///请求默认收货地址
  void requestDefaultAddress() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});

      String path = "api/oneAddressList?uid=${model.sId}&sign=$sign";
      var data = await DoNetwork().get(path);
      defaultAddressList.value = AddressModel.fromJson(data).result!;
      update();
    }
  }

  ///请求所有收货地址
  void requestAllAddressList() async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});
      String path = "api/addressList?uid=${model.sId}&sign=$sign";

      var data = await DoNetwork().get(path);
      allAddressList.value = AddressModel.fromJson(data).result!;
      update();
    }
  }

  ///修改默认收货地址
  void modifyDefaultAddress(String addressId) async {
    List list = await DoUserService.getUserInfo();
    if (list.isNotEmpty) {
      EasyLoading.show();
      UserModel model = UserModel.fromJson(list[0]);
      Map jsonMap = {"uid": model.sId, "id": addressId};
      String sign =
          DoSignService.createAndGetSign({...jsonMap, "salt": model.salt});

      var data = await DoNetwork()
          .post(modifyDefaultAddressPath, data: {...jsonMap, "sign": sign});
      if (data != null) {
        if (data["success"]) {
          EasyLoading.showSuccess(data["message"]);
          requestAddressData();
        } else {
          EasyLoading.showError(data["message"]);
        }
      } else {
        EasyLoading.showError(data["请求失败"]);
      }
      update();
    }
  }

  ///提交订单
  void submitOrder() async {
    if (defaultAddressList.isEmpty) {
      EasyLoading.showToast("请先添加收货地址");
    } else {
      List list = await DoUserService.getUserInfo();
      if (list.isNotEmpty) {
        EasyLoading.show(status: "提交中...");
        UserModel userModel = UserModel.fromJson(list[0]);
        AddressItemModel addressItemModel = defaultAddressList[0];
        Map jsonMap = {
          "uid": userModel.sId,
          "name": addressItemModel.name,
          "phone": addressItemModel.phone,
          "address": addressItemModel.address,
          "all_price":
              checkedTotalPrice.toStringAsFixed(1), //金额保留一位小数，与后台接口统一，不然验证不通过
          "products": json.encode(checkoutList) //传入json字符串
        };
        String sign = DoSignService.createAndGetSign(
            {...jsonMap, "salt": userModel.salt});

        var data = await DoNetwork()
            .post(createOrderPath, data: {...jsonMap, "sign": sign});
        // print(data);
        if (data != null) {
          if (data["success"]) {
            String orderId = data["result"]["order_id"];
            String orderPrice = data["result"]["all_price"];
            Get.toNamed("/payment", arguments: {
              "orderId": orderId,
              "orderPrice": orderPrice,
            });

            ///更新购物车数据
            ///因为来到结算页面的有两种情况：
            ///1.从购物车直接进入
            ///2.从商品详情页在直接点击“立即购买”的，这部分不能直接删除购物车中勾选的，因为可能不一样
            ///下面的做法是判断来到结算页面的商品数据是否在购物车中存在，若存在sId及商品属性一样的，就直接不放在结算后新的购物车列表了
            ///相当于没有考虑之前购物车有多少数量这款属性的产品，也没有考虑之前是不是勾选了
            await DoCartService.updateLocalCartListAfterSubmitOrder(
                checkoutList);

            ///刷新购物车---若是不是从购物车直接进入的呢，也刷新
            Get.find<CartController>().getLocalCartList();
            EasyLoading.showSuccess(data["message"]);
          } else {
            EasyLoading.showError(data["message"]);
          }
        } else {
          EasyLoading.showError(data["请求失败"]);
        }
        update();
      }
    }
  }
}
