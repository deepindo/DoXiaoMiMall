import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/order_model.dart';
import '../../../components/app_components.dart';
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
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined, size: DoScreenAdapter.fs(20))),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined,
                size: DoScreenAdapter.fs(20)))
      ],
      bottom: TabBar(
        tabs: controller.tabBarList,
        indicatorColor: DoColors.theme,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3,
        onTap: (value) {
          print("ontap${value}");
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
    return Obx(
      () => controller.orderList.isNotEmpty
          ? ListView(
              shrinkWrap: true,
              children: controller.orderList
                  .map((element) => _orderItem(element))
                  .toList(),
            )
          : commonEmptyView("暂无订单"),
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
  Widget _orderItem(OrderItemModel orderItemModel) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // print("跳转--${orderItemModel.sId}");
            Get.toNamed("/order-content", arguments: {
              "sId": orderItemModel.sId,
            });
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: DoScreenAdapter.w(10),
                vertical: DoScreenAdapter.h(5)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: DoScreenAdapter.w(20),
                            height: DoScreenAdapter.h(20),
                            child: Image.asset("assets/images/logo.png")),
                        SizedBox(width: DoScreenAdapter.w(5)),
                        Text(
                          "小米商城",
                          style: TextStyle(fontSize: DoScreenAdapter.fs(14)),
                        ),
                      ],
                    ),
                    Text(orderItemModel.payStatus == 0 ? "待付款" : "",
                        style: TextStyle(
                            fontSize: DoScreenAdapter.fs(14),
                            color: DoColors.theme))
                  ],
                ),
                SizedBox(height: DoScreenAdapter.w(5)),
                const Divider(height: 1, color: DoColors.gray238),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: orderItemModel.orderItem!
                      .map((e) => _orderGoodsItem(e))
                      .toList(),
                ),
                const Divider(height: 1, color: DoColors.gray238),
                SizedBox(height: DoScreenAdapter.w(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "${DateTime.fromMillisecondsSinceEpoch(orderItemModel.addTime!)}",
                        style: TextStyle(
                            fontSize: DoScreenAdapter.fs(12),
                            color: DoColors.gray154)),
                    Row(
                      children: [
                        Text("共${orderItemModel.orderItem!.length}件商品",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(12))),
                        SizedBox(width: DoScreenAdapter.w(10)),
                        Text("应付金额:",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(12))),
                        Text("￥",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(10))),
                        Text("${orderItemModel.allPrice}",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(18))),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: DoScreenAdapter.h(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Container()),
                    Wrap(
                      spacing: 5,
                      children: [
                        OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                // maximumSize: MaterialStateProperty.all(
                                //     Size.fromHeight(DoScreenAdapter.h(55))),
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                side: MaterialStateProperty.all(
                                    const BorderSide(color: DoColors.gray238))),
                            child: Text(
                              "取消订单",
                              style: TextStyle(
                                  fontSize: DoScreenAdapter.fs(12),
                                  color: DoColors.gray186),
                            )),
                        OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              side: MaterialStateProperty.all(
                                  const BorderSide(color: DoColors.theme))),
                          child: Text(
                            "修改地址",
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(12),
                                color: DoColors.theme),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              side: MaterialStateProperty.all(
                                  const BorderSide(color: DoColors.theme))),
                          child: Text(
                            "立即付款",
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(12),
                                color: DoColors.theme),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(height: DoScreenAdapter.h(5), color: DoColors.gray238),
      ],
    );
  }

  ///商品项
  Widget _orderGoodsItem(OrderGoodsItemModel goodsItemModel) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: DoScreenAdapter.h(10)),
      child: Row(children: [
        _coverSection(goodsItemModel.productImg),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _titleSection(goodsItemModel.productTitle)),
                  SizedBox(width: DoScreenAdapter.w(10)),
                  _priceSection(goodsItemModel.productPrice),
                ],
              ),
              SizedBox(height: DoScreenAdapter.h(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _attributesSection(goodsItemModel.selectedAttr),
                  _buyNumberSection(goodsItemModel.productCount),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  ///封面区
  Widget _coverSection(String? pic) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: DoScreenAdapter.h(10)),
        width: DoScreenAdapter.w(60),
        height: DoScreenAdapter.w(60),
        decoration: BoxDecoration(
            color: DoColors.gray249,
            borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
        child: Image.network(
          DoNetwork.replacePictureURL(pic!),
          fit: BoxFit.fitHeight,
        ));
  }

  ///标题区
  Widget _titleSection(String? title) {
    return Text(
      title ?? "",
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(color: DoColors.black51, fontSize: DoScreenAdapter.fs(14)),
    );
  }

  ///属性区
  Widget _attributesSection(String? attributes) {
    return Text(attributes ?? "",
        style: TextStyle(
          color: DoColors.gray154,
          fontSize: DoScreenAdapter.fs(12),
        ));
  }

  ///价格区
  Widget _priceSection(int? price) {
    return Row(children: [
      Text("￥",
          style: TextStyle(
              fontSize: DoScreenAdapter.fs(10), color: DoColors.gray154)),
      Text("$price",
          style: TextStyle(
              fontSize: DoScreenAdapter.fs(12), color: DoColors.gray154)),
    ]);
  }

  ///购买数量区
  Widget _buyNumberSection(int? buyNumber) {
    return Text("x $buyNumber",
        style: TextStyle(
          color: DoColors.gray154,
          fontSize: DoScreenAdapter.fs(12),
        ));
  }
}
