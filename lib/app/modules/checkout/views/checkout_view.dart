import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import '../../../services/app_colors.dart';
import '../../../services/app_network.dart';
import '../../../services/app_screenAdapter.dart';
import '../../../services/app_userService.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('确认订单'),
        centerTitle: true,
        backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
        elevation: 0,
      ),
      body: _body(),
    );
  }

  ///body部分
  Widget _body() {
    return Stack(
      children: [
        _contentListView(),
        _floatingView(),
      ],
    );
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
        children: [
          _deliveryAddressSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          ...controller.checkoutList.map((e) => _cartItemView(e)).toList(),
          _deliveryDateSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          _costSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          _invoiceSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
        ],
      ),
    );
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
                  Text(
                    "共38件,合计:",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(14),
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
                    "389494",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(18),
                        fontWeight: FontWeight.bold,
                        color: DoColors.theme),
                  )
                ],
              ),
              InkWell(
                onTap: () async {
                  if (await DoUserService.isLogin()) {
                    EasyLoading.showToast("选择支付方式付款");
                  } else {
                    Get.toNamed("/verification-code-login");
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(right: DoScreenAdapter.w(10)),
                  padding: EdgeInsets.fromLTRB(
                      DoScreenAdapter.w(25),
                      DoScreenAdapter.h(5),
                      DoScreenAdapter.w(25),
                      DoScreenAdapter.h(5)),
                  height: DoScreenAdapter.h(30),
                  decoration: BoxDecoration(
                      color: DoColors.theme,
                      borderRadius:
                          BorderRadius.circular(DoScreenAdapter.w(30))),
                  alignment: Alignment.center,
                  child: Text(
                    "去付款",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: DoScreenAdapter.fs(16)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  ///商品项
  Widget _cartItemView(Map element) {
    return Container(
      // margin: EdgeInsets.only(top: DoScreenAdapter.h(10)),
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(DoScreenAdapter.w(10)),
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
            child: Row(children: [
              _coverSection(element["pic"]),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _titleSection(element["title"]),
                    SizedBox(height: DoScreenAdapter.h(5)),
                    _attributesSection(element["selectedGoodsAttributes"]),
                    SizedBox(height: DoScreenAdapter.h(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _priceSection(element["price"]),
                        _buyNumberSection(element["buyNumber"]),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
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
  Widget _attributesSection(String attributes) {
    return Text(attributes,
        style: TextStyle(
          color: DoColors.gray154,
          fontSize: DoScreenAdapter.fs(12),
        ));
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

  ///购买数量区
  Widget _buyNumberSection(int buyNumber) {
    return Text("x $buyNumber",
        style: TextStyle(
          color: DoColors.gray154,
          fontSize: DoScreenAdapter.fs(12),
        ));
  }

  ///收货地址
  Widget _deliveryAddressSection() {
    return Obx(
      () => controller.addressList.isEmpty
          ? InkWell(
              onTap: () {
                Get.toNamed("/address-manager");
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DoScreenAdapter.w(10)),
                  color: Colors.white,
                ),
                child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: DoScreenAdapter.w(10), vertical: 0),
                    leading: Icon(
                      Icons.location_on_outlined,
                      size: DoScreenAdapter.fs(20),
                    ),
                    title: Text("添加地址",
                        style: TextStyle(fontSize: DoScreenAdapter.fs(14)))),
              ),
            )
          : InkWell(
              onTap: () {
                Get.toNamed("/address-manager");
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(
                    DoScreenAdapter.w(10),
                    DoScreenAdapter.h(10),
                    DoScreenAdapter.w(10),
                    DoScreenAdapter.h(0)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.addressList[0].address!,
                                // "${controller.model.value.username}",
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: DoScreenAdapter.fs(12),
                                ),
                              ),
                              SizedBox(height: DoScreenAdapter.h(2)),
                              Text(
                                controller.addressList[0].address!,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: DoScreenAdapter.fs(16),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: DoScreenAdapter.h(2)),
                              Row(
                                children: [
                                  Text(
                                    controller.addressList[0].name!,
                                    style: TextStyle(
                                        fontSize: DoScreenAdapter.fs(12)),
                                  ),
                                  SizedBox(width: DoScreenAdapter.w(20)),
                                  Text(
                                    controller.addressList[0].phone!,
                                    style: TextStyle(
                                      fontSize: DoScreenAdapter.fs(12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: DoScreenAdapter.w(10)),
                        Row(
                          children: [
                            Icon(Icons.arrow_forward_ios_outlined,
                                size: DoScreenAdapter.fs(12),
                                color: DoColors.black128)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: DoScreenAdapter.h(10)),
                    const Divider(height: 0.5, color: DoColors.gray238)
                  ],
                ),
              ),
            ),
    );
  }

  ///配送日期
  Widget _deliveryDateSection() {
    return Container(
      padding: EdgeInsets.all(DoScreenAdapter.w(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DoScreenAdapter.w(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("配送日期",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14), color: DoColors.black51)),
            trailing: Text("中小件预计3月24日送达",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(12), color: DoColors.black51)),
          )
        ],
      ),
    );
  }

  ///费用相关
  Widget _costSection() {
    return Container(
      padding: EdgeInsets.all(DoScreenAdapter.w(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DoScreenAdapter.w(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("商品总价",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14), color: DoColors.black51)),
            trailing: Text("￥3979",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(12), color: DoColors.black51)),
          ),
          ListTile(
            title: Text("优惠券",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14), color: DoColors.black51)),
            trailing: Wrap(
              children: [
                Text("无可用",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(12),
                        color: DoColors.gray154)),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: DoScreenAdapter.fs(15),
                )
              ],
            ),
          ),
          ListTile(
            title: Text("红包",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14), color: DoColors.black51)),
            trailing: Wrap(
              children: [
                Text("无可用",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(12),
                        color: DoColors.gray154)),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: DoScreenAdapter.fs(15),
                )
              ],
            ),
          ),
          ListTile(
            title: Text("运费",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14), color: DoColors.black51)),
            trailing: Text("包邮",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(12), color: DoColors.black51)),
          ),
        ],
      ),
    );
  }

  ///发票
  Widget _invoiceSection() {
    return Container(
      padding: EdgeInsets.all(DoScreenAdapter.w(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DoScreenAdapter.w(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("发票",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14), color: DoColors.black51)),
            trailing: Wrap(
              children: [
                Text("个人电子发票",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(12),
                        color: DoColors.black51)),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: DoScreenAdapter.fs(15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
