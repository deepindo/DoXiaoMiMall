import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/order_content_controller.dart';

class OrderContentView extends GetView<OrderContentController> {
  const OrderContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.requestOrderContent();
    return Scaffold(
      appBar: AppBar(
        title: const Text('订单详情'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_checkout_outlined,
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
        Text("${controller.sId}"),
        _contentListView(),
        // _floatingView(),
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
        padding: EdgeInsets.all(DoScreenAdapter.w(10)),
        children: [
          _deliveryInfoSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          // ...controller.checkoutList.map((e) => _cartItemView(e)).toList(),
          _goodsInfoSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          _paymentInfoSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          _paymentInfoSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          _orderInfoSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          _operateMenuSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
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
              color: Colors.cyan,
              border:
                  Border(top: BorderSide(width: 0.5, color: DoColors.gray238))),
          padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
          child: Container(
            color: Colors.red,
            margin: EdgeInsets.only(bottom: DoScreenAdapter.bottomH()),
            // child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // children: [
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(child: Container()),
            //       Wrap(
            //         children: [
            //           Text("data1"),
            //           Text("data2"),
            //         ],
            //       )
            //     ],
            //   ),
            // ],
            // ),
          ),
        ));
  }

  ///送货地址区
  Widget _deliveryInfoSection() {
    return Container(
      height: DoScreenAdapter.h(100),
      color: Colors.cyan,
    );
  }

  ///商品区：最好拆分成发货单
  Widget _goodsInfoSection() {
    return Container(
      height: DoScreenAdapter.h(100),
      color: Colors.green,
    );
  }

  ///订单金额区
  Widget _paymentInfoSection() {
    return Container(
      height: DoScreenAdapter.h(100),
      color: Colors.purple,
    );
  }

  ///订单信息区
  Widget _orderInfoSection() {
    return Container(
      height: DoScreenAdapter.h(100),
      color: Colors.orange,
    );
  }

  ///操作区
  Widget _operateMenuSection() {
    return Container(
      height: DoScreenAdapter.h(100),
      color: Colors.red,
    );
  }
}
