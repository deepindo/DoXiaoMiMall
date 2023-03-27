import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../models/order_model.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_network.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/order_content_controller.dart';

class OrderContentView extends GetView<OrderContentController> {
  const OrderContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.requestOrderContent();
    return Scaffold(
      backgroundColor: DoColors.gray249,
      appBar: AppBar(
        title: const Text('订单详情'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined,
                  size: DoScreenAdapter.fs(20)))
        ],
      ),
      body: _body(),
    );
  }

  ///body部分
  Widget _body() {
    return Stack(
      children: [
        // Text("${controller.sId}"),
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
      bottom: DoScreenAdapter.adapterBottomH(),
      child:
          // Obx(
          //   () =>
          // controller.orderList.isNotEmpty
          // ?
          ListView(
        // padding: EdgeInsets.all(DoScreenAdapter.w(10)),
        children: [
          _deliveryInfoSection(),
          SizedBox(height: DoScreenAdapter.h(5)),
          // _goodsInfoSection(),
          SizedBox(height: DoScreenAdapter.h(5)),
          _paymentInfoSection(),
          SizedBox(height: DoScreenAdapter.h(5)),
          _orderInfoSection(),
          _operateMenuSection(),
        ],
        // ),
        // : const Center(child: SpinKitFadingCircle(color: Colors.white)),
      ),
    );
  }

  ///底部浮动区
  Widget _floatingView() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        height: DoScreenAdapter.adapterBottomH(),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(width: 0.5, color: DoColors.gray238))),
          padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: DoScreenAdapter.bottomH()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container()),
                Wrap(
                  spacing: DoScreenAdapter.w(10),
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: DoScreenAdapter.w(10),
                            vertical: DoScreenAdapter.h(5)),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: DoColors.gray168),
                            borderRadius:
                                BorderRadius.circular(DoScreenAdapter.w(30))),
                        child: Text(
                          "删除订单",
                          style: TextStyle(fontSize: DoScreenAdapter.fs(14)),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: DoScreenAdapter.w(10),
                            vertical: DoScreenAdapter.h(5)),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: DoColors.gray168),
                            borderRadius:
                                BorderRadius.circular(DoScreenAdapter.w(30))),
                        child: Text(
                          "申请售后",
                          style: TextStyle(fontSize: DoScreenAdapter.fs(14)),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  ///送货地址区
  Widget _deliveryInfoSection() {
    return Container(
      padding: EdgeInsets.all(DoScreenAdapter.w(10)),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: DoScreenAdapter.fs(16)),
              SizedBox(width: DoScreenAdapter.w(5)),
              Text("xxxx", style: TextStyle(fontSize: DoScreenAdapter.fs(14))),
              SizedBox(width: DoScreenAdapter.w(10)),
              Text("15528778969",
                  style: TextStyle(fontSize: DoScreenAdapter.fs(14))),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: DoScreenAdapter.h(5), left: DoScreenAdapter.w(20)),
            child: Expanded(
              child: Text(
                  "xxxx yyyyy zzzz aaaaa bbbbb ccccccccccc dddddd eeeeeeffffffffffffffffffffff",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: DoScreenAdapter.fs(12),
                      color: DoColors.gray154)),
            ),
          )
        ],
      ),
    );
  }

  ///----------
  ///商品区：最好拆分成发货单
  Widget _goodsInfoSection(OrderItemModel orderItemModel) {
    return Container(
      color: Colors.green,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children:
            orderItemModel.orderItem!.map((e) => _orderGoodsItem(e)).toList(),
      ),
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

  ///----------
  ///订单金额区
  Widget _paymentInfoSection() {
    return Container(
      padding: EdgeInsets.only(top: DoScreenAdapter.w(10)),
      color: Colors.white,
      child: Column(
        children: [
          _commonSpaceBetweenTile("订单金额:", "xxxxx"),
          _commonSpaceBetweenTile("免运费:", "xxxxx"),
          _commonSpaceBetweenTile("支付优惠:", "xxxxx"),
          const Divider(height: 1, color: DoColors.gray238),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: DoScreenAdapter.w(10),
                vertical: DoScreenAdapter.h(5)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("实付金额:",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(16),
                          color: DoColors.theme)),
                  Text("￥248",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(16),
                          color: DoColors.theme))
                ]),
          ),
        ],
      ),
    );
  }

  ///订单信息区
  Widget _orderInfoSection() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: DoScreenAdapter.w(10)),
      child: Column(
        children: [
          _commonSpaceBetweenTile("下单时间:", "xxxxx"),
          _commonSpaceBetweenTile("付款时间:", "xxxxx"),
          _commonSpaceBetweenTile("订单编号:", "xxxxx"),
          _commonSpaceBetweenTile("发票类型:", "xxxxx"),
          _commonSpaceBetweenTile("发票抬头:", "xxxxx")
        ],
      ),
    );
  }

  ///操作区
  Widget _operateMenuSection() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: DoScreenAdapter.w(10), vertical: DoScreenAdapter.h(10)),
      margin: EdgeInsets.only(bottom: DoScreenAdapter.bottomH()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Container()),
          Wrap(
            spacing: DoScreenAdapter.w(10),
            children: [
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: DoScreenAdapter.w(10),
                      vertical: DoScreenAdapter.h(5)),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: DoColors.gray168),
                      borderRadius:
                          BorderRadius.circular(DoScreenAdapter.w(30))),
                  child: Text(
                    "查看发票",
                    style: TextStyle(fontSize: DoScreenAdapter.fs(14)),
                  )),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: DoScreenAdapter.w(10),
                      vertical: DoScreenAdapter.h(5)),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: DoColors.gray168),
                      borderRadius:
                          BorderRadius.circular(DoScreenAdapter.w(30))),
                  child: Text(
                    "联系客服",
                    style: TextStyle(fontSize: DoScreenAdapter.fs(14)),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  ///通用左右标题
  Widget _commonSpaceBetweenTile(String leadingTitle, String trailingTitle) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: DoScreenAdapter.w(10), vertical: DoScreenAdapter.h(5)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(leadingTitle, style: TextStyle(fontSize: DoScreenAdapter.fs(14))),
        Text(trailingTitle, style: TextStyle(fontSize: DoScreenAdapter.fs(14)))
      ]),
    );
  }
}
