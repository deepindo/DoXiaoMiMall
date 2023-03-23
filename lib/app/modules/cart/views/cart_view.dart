import 'package:doxiaomimall/app/services/app_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_screenAdapter.dart';
import '../../../components/app_components.dart';
import '../../../services/app_userService.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView {
  ///商品详情页也要跳转购物车，加上tabs里面是懒加载cartController，
  ///所以去掉懒加载依赖，改为在cartView的put，以实现效果
  ///CartView在多个地方调用，所以手动实现下面的控制器
  @override
  final CartController controller = Get.put(CartController());
  CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: _customAppBar(),
      body: _body(),
    );
  }

  ///自定义的appBar
  AppBar _customAppBar() {
    return AppBar(
      title: Text(
        '购物车',
        style: TextStyle(
          fontSize: DoScreenAdapter.fs(16),
          color: DoColors.black0,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
      elevation: 0,
      actions: [
        TextButton(
            onPressed: () {
              controller.changeEditingButtonState();
            },
            child: Obx(
              () => Text(
                controller.isEditing.value ? "完成" : "编辑",
                style: TextStyle(
                  fontSize: DoScreenAdapter.fs(14),
                  color: DoColors.black0,
                ),
              ),
            )),
      ],
    );
  }

  ///body部分
  Widget _body() {
    ///这里为了保证实时渲染，用GetBuilder替换Obx，底部浮动也需要控制，所以对整体添加的
    return GetBuilder<CartController>(
        initState: (state) {
          ///这里每次update都会执行
          controller.getLocalCartList();
        },
        init: controller,
        builder: (controller) {
          return controller.cartList.isNotEmpty
              ? Stack(
                  children: [
                    _contentListView(),
                    _floatingView(),
                  ],
                )
              : _emptyView();
        });
  }

  ///底部浮动区
  Widget _floatingView() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        height: DoScreenAdapter.h(60),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(width: 0.5, color: DoColors.gray238))),
          padding: EdgeInsets.all(DoScreenAdapter.w(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  commonRoundCheckBox(controller.checkedAllState.value,
                      onTap: (value) {
                    controller.changeCheckedAllBoxState(value);
                  }),
                  Text(
                    "全选",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(14),
                        fontWeight: FontWeight.bold,
                        color: DoColors.black51),
                  )
                ],
              ),
              Obx(
                () => controller.isEditing.value
                    ? Row(
                        children: [
                          InkWell(
                            onTap: () {
                              ///删除和与结算共用一套选中逻辑，要是分开各自记录，就特别麻烦了，相关的都得两套
                              if (controller.checkedCount.value > 0) {
                                controller.deleteGoods();
                                EasyLoading.showToast("移入收藏夹并删除");
                              } else {
                                EasyLoading.showToast("请勾选需要删除的商品");
                              }
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: DoScreenAdapter.w(10)),
                              padding: EdgeInsets.fromLTRB(
                                  DoScreenAdapter.w(15),
                                  DoScreenAdapter.h(0),
                                  DoScreenAdapter.w(15),
                                  DoScreenAdapter.h(0)),
                              height: DoScreenAdapter.h(30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      DoScreenAdapter.w(30)),
                                  border: Border.all(
                                      color: DoColors.gray186,
                                      width: DoScreenAdapter.w(1))),
                              alignment: Alignment.center,
                              child: Text(
                                (controller.checkedCount.value > 0)
                                    ? "移入收藏 (${controller.checkedCount.value})"
                                    : "移入收藏",
                                style: TextStyle(
                                    color: DoColors.gray154,
                                    fontSize: DoScreenAdapter.fs(14)),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.checkedCount.value > 0) {
                                ///弹框，确定删除
                                controller.deleteGoods();
                                EasyLoading.showToast("删除成功");
                              } else {
                                EasyLoading.showToast("请勾选需要删除的商品");
                              }
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: DoScreenAdapter.w(10)),
                              padding: EdgeInsets.fromLTRB(
                                  DoScreenAdapter.w(15),
                                  DoScreenAdapter.h(0),
                                  DoScreenAdapter.w(15),
                                  DoScreenAdapter.h(0)),
                              height: DoScreenAdapter.h(30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      DoScreenAdapter.w(30)),
                                  border: Border.all(
                                      color: DoColors.gray154,
                                      width: DoScreenAdapter.w(1))),
                              alignment: Alignment.center,
                              child: Text(
                                (controller.checkedCount.value > 0)
                                    ? "删除 (${controller.checkedCount.value})"
                                    : "删除",
                                style: TextStyle(
                                    color: DoColors.gray154,
                                    fontSize: DoScreenAdapter.fs(14)),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "合计",
                                    style: TextStyle(
                                        fontSize: DoScreenAdapter.fs(14),
                                        // fontWeight: FontWeight.bold,
                                        color: DoColors.black51),
                                  ),
                                  Text(
                                    "(不含运费):",
                                    style: TextStyle(
                                        fontSize: DoScreenAdapter.fs(12),
                                        color: DoColors.gray154),
                                  ),
                                  Text(
                                    "￥",
                                    style: TextStyle(
                                        fontSize: DoScreenAdapter.fs(10),
                                        fontWeight: FontWeight.bold,
                                        color: DoColors.theme),
                                  ),
                                  Text(
                                    "19796",
                                    style: TextStyle(
                                        fontSize: DoScreenAdapter.fs(16),
                                        fontWeight: FontWeight.bold,
                                        color: DoColors.theme),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: DoScreenAdapter.h(5),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "免运费",
                                    style: TextStyle(
                                        fontSize: DoScreenAdapter.fs(14),
                                        color: DoColors.gray154),
                                  ),
                                  SizedBox(width: DoScreenAdapter.w(5)),
                                  InkWell(
                                    onTap: () {
                                      EasyLoading.showToast("bottomSheet");
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "明细",
                                          style: TextStyle(
                                              fontSize: DoScreenAdapter.fs(14),
                                              color: DoColors.theme),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: DoColors.theme,
                                          size: DoScreenAdapter.fs(15),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              if (await DoUserService.isLogin()) {
                                if (controller.checkedCount.value > 0) {
                                  Get.toNamed("/checkout", arguments: {
                                    "checkoutList": controller.getCheckedList()
                                  });
                                } else {
                                  EasyLoading.showToast("请勾选需要结算的商品");
                                }
                              } else {
                                Get.toNamed("/verification-code-login");
                              }
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: DoScreenAdapter.w(10)),
                              padding: EdgeInsets.fromLTRB(
                                  DoScreenAdapter.w(15),
                                  DoScreenAdapter.h(5),
                                  DoScreenAdapter.w(15),
                                  DoScreenAdapter.h(5)),
                              height: DoScreenAdapter.h(40),
                              decoration: BoxDecoration(
                                  color: DoColors.theme,
                                  borderRadius: BorderRadius.circular(
                                      DoScreenAdapter.w(30))),
                              alignment: Alignment.center,
                              child: Text(
                                (controller.checkedCount.value > 0)
                                    ? "结算 (${controller.checkedCount.value})"
                                    : "结算",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: DoScreenAdapter.fs(16)),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ));
  }

  ///内容列表
  Widget _contentListView() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: DoScreenAdapter.h(60),
      child: ListView(
        padding: EdgeInsets.all(DoScreenAdapter.w(10)),
        children: controller.cartList
            .map((element) => _cartItemView(element))
            .toList(),
      ),
    );
  }

  ///空数据时显示
  Widget _emptyView() {
    return SizedBox(
      // color: Colors.cyan,
      width: double.infinity,
      height: DoScreenAdapter.h(250),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/emptyOrder.png",
            width: DoScreenAdapter.w(100),
            height: DoScreenAdapter.w(100),
            // color: Colors.cyan,
            fit: BoxFit.fill,
          ),
          SizedBox(height: DoScreenAdapter.h(10)),
          Text(
            "购物车空空如也",
            style: TextStyle(
                fontSize: DoScreenAdapter.fs(14), color: DoColors.gray154),
          ),
          SizedBox(height: DoScreenAdapter.h(10)),
          OutlinedButton(
              onPressed: () {
                Get.offAllNamed("/tabs");
              },
              child: Text(
                "随便看看",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14), color: DoColors.black128),
              )),
        ],
      ),
    );
  }

  ///商品细项
  ///
  ///这里因为抽取，需要传递很多次参数！！！
  ///
  Widget _cartItemView(Map element) {
    return InkWell(
      onTap: () {
        ///购物车直接进入有问题，相当于：商品详情A->购物车B->商品详情A,会错乱，
        ///除非这是两个不同的详情页，因为商品详情A没有释放，sId一直是开始传入的，
        ///这个时候不管点购物车哪件商品，看到的详情都是同一个
        // Get.toNamed("/goods-content", arguments: {"sid": element["sId"]});
      },
      child: Container(
        margin: EdgeInsets.only(top: DoScreenAdapter.h(10)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DoScreenAdapter.w(10)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // height: DoScreenAdapter.w(80),
              padding: EdgeInsets.fromLTRB(
                DoScreenAdapter.w(0), //与浮动区对齐，左不加
                DoScreenAdapter.h(10),
                DoScreenAdapter.w(10),
                DoScreenAdapter.h(10),
              ),
              child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _checkboxSection(element),
                    _coverSection(element["pic"]),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _titleSection(element["title"]),
                          SizedBox(height: DoScreenAdapter.h(5)),
                          _attributesSection(
                              element["selectedGoodsAttributes"]),
                          SizedBox(height: DoScreenAdapter.h(10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _priceSection(element["price"]),
                              _numSection(element),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  ///-----------------子组件区-----------------
  ///选择区
  Widget _checkboxSection(Map element) {
    return commonRoundCheckBox(element["checked"], onTap: (value) {
      controller.changeCheckboxState(element);
    });
  }

  ///封面区
  Widget _coverSection(String? pic) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: DoScreenAdapter.h(10)),
        padding: EdgeInsets.all(DoScreenAdapter.w(5)),
        width: DoScreenAdapter.w(100),
        height: DoScreenAdapter.w(100),
        decoration: BoxDecoration(
            color: DoColors.gray249,
            borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
        child: Image.network(
          DoNetwork.replacePictureURL(pic!),
          // "https://www.itying.com/images/b_focus01.png",
          fit: BoxFit.fitHeight,
        ));
  }

  ///标题区
  Widget _titleSection(String title) {
    return Text(
      title,
      // "小米小米小米小米小米小米小米小米小米小小米小米小米小米小米小米小米小米小米小小米小米小米小米小米小米小米小米小米小",
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(color: DoColors.black51, fontSize: DoScreenAdapter.fs(14)),
    );
  }

  ///属性区
  Widget _attributesSection(String selectedGoodsAttributes) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            EasyLoading.showToast("bottomSheet显示对应商品的类型选择框");
          },
          child: Container(
            padding: EdgeInsets.all(DoScreenAdapter.w(5)),
            decoration: BoxDecoration(
                color: DoColors.gray249,
                borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
            child: Row(
              children: [
                Text(selectedGoodsAttributes,
                    // "黑色",
                    style: TextStyle(
                      color: DoColors.black51,
                      fontSize: DoScreenAdapter.fs(10),
                    )),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: DoScreenAdapter.fs(10),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ///价格区
  Widget _priceSection(int price) {
    return Row(children: [
      Text("￥",
          style: TextStyle(
              fontSize: DoScreenAdapter.fs(10),
              fontWeight: FontWeight.bold,
              color: DoColors.theme)),
      Text("$price",
          // "1199",
          style: TextStyle(
              fontSize: DoScreenAdapter.fs(16),
              fontWeight: FontWeight.bold,
              color: DoColors.theme)),
    ]);
  }

  ///数量区
  Widget _numSection(Map element) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.cyan,
          border: Border.all(color: DoColors.gray238, width: 0.5),
          borderRadius: BorderRadius.circular(DoScreenAdapter.w(20))),
      height: DoScreenAdapter.h(22),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              controller.minusBuyNumber(element);
            },
            child: Container(
              alignment: Alignment.center,
              width: DoScreenAdapter.w(36),
              child: Text(
                "-",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(18),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(color: DoColors.gray238, width: 0.5),
                  right: BorderSide(color: DoColors.gray238, width: 0.5)),
            ),
            alignment: Alignment.center,
            width: DoScreenAdapter.w(42),
            child: TextField(
              style: TextStyle(
                  fontSize: DoScreenAdapter.fs(14),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) {},
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: "${element["buyNumber"]}"
                  // "12"
                  ),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          InkWell(
            onTap: () {
              controller.plusBuyNumber(element);
            },
            child: Container(
              alignment: Alignment.center,
              width: DoScreenAdapter.w(36),
              child: Text(
                "+",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(18),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
