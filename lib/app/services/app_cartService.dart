import '../services/app_sharedPreferences.dart';
import '../models/goods_content_model.dart';

const String CARTKEY = "cart";

class DoCartService {
  ///添加到(保存本地)购物车
  static addToLocalCartList(
    String? sId,
    String? title,
    int? price,
    String? pic,
    // GoodsContentInfoModel goodsContent,
    String selectedGoodsAttributes,
    int buyNumber,
  ) async {
    List? cartList = await DoSharedPreferences.getData(CARTKEY);
    if (cartList != null) {
      /// 判断是否有相同的数据
      var isHaveSameData = cartList.any((element) =>
          element["sId"] == sId &&
          element["selectedGoodsAttributes"] == selectedGoodsAttributes);

      ///有添加过相同的，找到改变数量
      if (isHaveSameData) {
        ///为啥出现下面的情况，list不能用forEach？
        ///Function literals should not be passed to 'forEach'.
        ///Try using a 'for' loop
        // cartList.forEach((element) {
        //   if (element["sId"] == goodsContent.sId &&
        //       element["selectedGoodsAttributes"] == selectedGoodsAttributes) {
        //     element["buyNumber"] += buyNumber;
        //   }
        // });
        for (var element in cartList) {
          if (element["sId"] == sId &&
              element["selectedGoodsAttributes"] == selectedGoodsAttributes) {
            element["buyNumber"] += buyNumber;
          }
        }
      } else {
        ///没有添加相同的
        cartList.add(
          {
            // "goodsModel": goodsContent<GoodsContentInfoModel>,
            "sId": sId,
            "title": title,
            "price": price,
            "pic": pic,
            "selectedGoodsAttributes": selectedGoodsAttributes,
            "buyNumber": buyNumber,
            "checked": true,
          },
        );
      }
      await DoSharedPreferences.setData(CARTKEY, cartList);
    } else {
      ///没有添加过
      List tempList = [];

      ///为了本地展示，不是所有字段都弄过来
      tempList.add(
        {
          "sId": sId,
          "title": title,
          "price": price,
          "pic": pic,
          "selectedGoodsAttributes": selectedGoodsAttributes,
          "buyNumber": buyNumber,
          "checked": true,
        },
      );
      await DoSharedPreferences.setData(CARTKEY, tempList);
    }
  }

  ///获取本地购物车列表
  static Future<List> getLocalCartList() async {
    List? cartList = await DoSharedPreferences.getData(CARTKEY);
    return cartList ?? [];
  }

  ///设置本地购物车列表
  static setLocalCartList(dynamic value) async {
    await DoSharedPreferences.setData(CARTKEY, value);
  }

  ///获取本地购物车列表
  static Future<List> getAllCheckedOfLocalCartList() async {
    List? cartList = await DoSharedPreferences.getData(CARTKEY);
    if (cartList != null) {
      return cartList.map((e) => e["checked"] == true).toList();
      // for (var element in cartList) {
      //    return
      // }
    } else {
      return [];
    }
  }

  ///更新某一项本地购物车记录-选中状态
  static updateLocalCartItemCheckedState(
      String sId, String selectedGoodsAttributes) async {
    List? cartList = await DoSharedPreferences.getData(CARTKEY);
    if (cartList != null) {
      for (var element in cartList) {
        if (element["sId"] == sId &&
            element["selectedGoodsAttributes"] == selectedGoodsAttributes) {
          element["checked"] = !element["checked"];
        }
      }
      await DoSharedPreferences.setData(CARTKEY, cartList);
    }
  }

  ///更新全部本地购物车记录-选中状态
  static updateLocalCartAllCheckedState(bool state) async {
    List? cartList = await DoSharedPreferences.getData(CARTKEY);
    if (cartList != null) {
      for (var element in cartList) {
        element["checked"] = state;
      }
      await DoSharedPreferences.setData(CARTKEY, cartList);
    }
  }

  ///更新本地购物车记录-数量
  static updateLocalCartItemBuyNumber(
      String sId, String selectedGoodsAttributes, int buyNumber) async {
    List? cartList = await DoSharedPreferences.getData(CARTKEY);
    if (cartList != null) {
      for (var element in cartList) {
        if (element["sId"] == sId &&
            element["selectedGoodsAttributes"] == selectedGoodsAttributes) {
          element["buyNumber"] = buyNumber;
        }
      }
      await DoSharedPreferences.setData(CARTKEY, cartList);
    }
  }

  ///更新本地购物车记录-属性
  static updateLocalCartItemAttributes(
    String? sId,
    String? title,
    int? price,
    String? pic,
    String oldSelectedGoodsAttributes,
    String newSelectedGoodsAttributes,
    int newBuyNumber,
  ) async {
    List? cartList = await DoSharedPreferences.getData(CARTKEY);
    if (cartList != null) {
      for (var element in cartList) {
        if (element["sId"] == sId &&
            element["selectedGoodsAttributes"] == oldSelectedGoodsAttributes) {
          ///先删除旧的
          cartList.remove(element);
        }
      }

      ///再添加新的---走的是添加的逻辑，如第一个方法
      addToLocalCartList(
          sId, title, price, pic, newSelectedGoodsAttributes, newBuyNumber);

      await DoSharedPreferences.setData(CARTKEY, cartList);
    }
  }

  ///删除本地购物车记录--若是全部记录，效果和下面就一样了，可能是单条或者多条
  static deleteLocalCartItems(GoodsContentInfoModel goodsContent,
      String selectedGoodsAttributes) async {
    List? cartList = await DoSharedPreferences.getData(CARTKEY);
    if (cartList != null) {
      // for (var element in cartList) {
      // if (element["sId"] == goodsContent.sId &&
      //     element["selectedGoodsAttributes"] == selectedGoodsAttributes) {

      ///这样一条实现了一个for循环外加判断，不知道直接操作cartList删除
      ///
      ///是不是不安全！！！！！！！
      ///
      cartList.removeWhere((element) => (element["sId"] == goodsContent.sId &&
          element["selectedGoodsAttributes"] == selectedGoodsAttributes));
      // }
      // }

      await DoSharedPreferences.setData(CARTKEY, cartList);
    }
  }

  ///生成订单后，更新本地购物车
  static updateLocalCartListAfterSubmitOrder(List checkoutList) async {
    List? cartList = await DoSharedPreferences.getData(CARTKEY);
    if (cartList != null) {
      var tempList = [];
      for (var element in cartList) {
        /*
        for (var e in checkoutList) {
          if (!(element["sId"] == e["sId"] &&
              element["selectedGoodsAttributes"] ==
                  e["selectedGoodsAttributes"])) {
            tempList.add(element);
          }
        }
        */
        /// 上面的写法，像在一个嵌套循环里面做这个不太好操作，
        /// 因为tempList.add(element);
        /// 得是在内循环整体完成一轮后操作，而不是在内层每次都加

        ///下面用两种方式来实现
        ///1：在上面有问题基础上的改进
        /*
        bool isHaveSame = false;
        for (var e in checkoutList) {
          //有一次就设置为true，而不是
          if (element["sId"] == e["sId"] &&
              element["selectedGoodsAttributes"] ==
                  e["selectedGoodsAttributes"]) {
            isHaveSame = true;
          }
        }
        if (!isHaveSame) {
          tempList.add(element);
        }
        */

        /// 判断是否有相同的数据
        /// 2：通过any函数
        var isHaveSameData = checkoutList.any((e) =>
            element["sId"] == e["sId"] &&
            element["selectedGoodsAttributes"] == e["selectedGoodsAttributes"]);
        if (!isHaveSameData) {
          tempList.add(element);
        }
      }
      setLocalCartList(tempList);
    }
  }

  ///清空本地购物车记录
  static removeAllLocalCartList() async {
    await DoSharedPreferences.removeData(CARTKEY);
  }
}
