import 'package:doxiaomimall/app/services/app_cartService.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/app_colors.dart';
import '../../../services/app_network.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/order_list_controller.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: _body(),
    );
  }

  ///自定义appBar
  PreferredSizeWidget _customAppBar() {
    return AppBar(
      title: const Text('商城订单'),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
      ],
      bottom: TabBar(
        tabs: controller.tabBarList,
        onTap: (value) {
          //只是点击事件
          // print("ontap${value}");
        },
        controller: controller.tabController,
        isScrollable: false,
      ),
    );
  }

  ///body部分
  Widget _body() {
    return TabBarView(
      controller: controller.tabController,
      children: [
        _allOrderListView(),
        _waitingPayOrderListView(),
        _waitingReceiverOrderListView(),
        _waitingCommentOrderListView()
      ],
    );
  }

  ///全部
  Widget _allOrderListView() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _orderItem(),
        _orderItem(),
        _orderItem(),
        // Container(
        //   height: DoScreenAdapter.h(100),
        //   color: Colors.red,
        // )
      ],
    );
  }

  ///待付款
  Widget _waitingPayOrderListView() {
    return ListView(
      children: [
        Container(
          color: Colors.orange,
        )
      ],
    );
  }

  ///待收货
  Widget _waitingReceiverOrderListView() {
    return ListView(
      children: [
        Container(
          color: Colors.green,
        )
      ],
    );
  }

  ///待评价
  Widget _waitingCommentOrderListView() {
    return ListView(
      children: [
        Container(
          color: Colors.cyan,
        )
      ],
    );
  }

  ///订单子项
  Widget _orderItem() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      width: DoScreenAdapter.w(20),
                      height: DoScreenAdapter.h(20),
                      child: Image.asset("assets/images/logo.png")),
                  Text("小米商城"),
                ],
              ),
              Text("待付款")
            ],
          ),
          Divider(height: 0.5, color: DoColors.gray238),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [Text("xxxx"), Text("xxxx")],
          ),
          Divider(height: 0.5, color: DoColors.gray238),
          Row(
            children: [
              Text("2023-03-24 00:34"),
              Text("共2件商品"),
              Text("应付金额"),
              Text("￥"),
              Text("1799.00"),
            ],
          ),
          Row(
            children: [
              Wrap(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text("取消订单"),
                      style: ButtonStyle()),
                  TextButton(
                      onPressed: () {},
                      child: Text("修改地址"),
                      style: ButtonStyle()),
                  TextButton(
                      onPressed: () {},
                      child: Text("立即付款"),
                      style: ButtonStyle()),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  ///商品项
  Widget _orderGoodsItem(Map element) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _titleSection(element["title"]),
                        _priceSection(element["price"]),
                      ],
                    ),
                    SizedBox(height: DoScreenAdapter.h(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _attributesSection(element["selectedGoodsAttributes"]),
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
}
