import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/app_components.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoColors.gray249,
      appBar: AppBar(
        title: const Text('小米收银台'),
        centerTitle: true,
        backgroundColor: DoColors.gray249,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Get.toNamed("/order-list");
              },
              child: const Text("订单中心"))
        ],
      ),
      body: _body(),
    );
  }

  ///body部分
  Widget _body() {
    return Stack(
      children: [
        _paymentInfoSection(),
        _contentListView(),
        _floatingView(),
      ],
    );
  }

  ///待付信息区
  Widget _paymentInfoSection() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: DoScreenAdapter.h(90),
        color: DoColors.gray249,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: DoScreenAdapter.h(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "￥",
                  style: TextStyle(
                      fontSize: DoScreenAdapter.fs(14),
                      fontWeight: FontWeight.bold,
                      color: DoColors.theme),
                ),
                Text(
                  "389494",
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: DoScreenAdapter.fs(30),
                      color: DoColors.theme,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: DoScreenAdapter.h(10)),
            Container(
              width: DoScreenAdapter.w(160),
              decoration: BoxDecoration(
                  color: DoColors.gray238,
                  borderRadius: BorderRadius.circular(DoScreenAdapter.w(20))),
              padding: EdgeInsets.symmetric(
                  horizontal: DoScreenAdapter.w(10),
                  vertical: DoScreenAdapter.h(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "支付剩余时间: ",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(12),
                        color: DoColors.gray186),
                  ),
                  Text(
                    "00:14:16",
                    style: TextStyle(
                        fontSize: DoScreenAdapter.fs(12),
                        color: DoColors.gray186),
                  )
                ],
              ),
            ),
            SizedBox(height: DoScreenAdapter.h(10)),
          ],
        ),
      ),
    );
  }

  ///内容列表
  Widget _contentListView() {
    return Positioned(
      left: 0,
      right: 0,
      top: DoScreenAdapter.h(90),
      bottom: DoScreenAdapter.adapterBottomH(),
      child: ListView(
        padding: EdgeInsets.all(DoScreenAdapter.w(10)),
        children: [
          // paymentInfoSection(),
          paymentToolsSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          creditProductSection(),
        ],
      ),
    );
  }

  ///支付工具区
  Widget paymentToolsSection() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
      child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
                padding: EdgeInsets.all(DoScreenAdapter.w(10)),
                child: Text("支付工具",
                    style: TextStyle(
                        color: DoColors.black128,
                        fontSize: DoScreenAdapter.fs(14),
                        fontWeight: FontWeight.bold))),
            ...controller.payToolsList
                .map((element) => Obx(
                      () => ListTile(
                          leading: SizedBox(
                              width: DoScreenAdapter.w(25),
                              height: DoScreenAdapter.h(25),
                              child: Image.network(element["image"])),
                          title: Text(
                            element["title"],
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(16),
                                color: DoColors.black128),
                          ),
                          subtitle: Text(
                            element["subTitle"],
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(12),
                                color: DoColors.gray186),
                          ),
                          trailing: commonRoundCheckBox(
                              controller.selectedPaymentToolIndex.value ==
                                  element["id"], onTap: (selected) {
                            controller.changePaymentToolIndex(element["id"]);
                          })),
                    ))
                .toList()
          ]),
    );
  }

  ///信货产品区
  Widget creditProductSection() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
      child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.all(DoScreenAdapter.w(10)),
              child: Text("信货产品",
                  style: TextStyle(
                      color: DoColors.black128,
                      fontSize: DoScreenAdapter.fs(14),
                      fontWeight: FontWeight.bold)),
            ),
            ...controller.creditProductsList
                .map((element) => Obx(
                      () => ListTile(
                        leading: SizedBox(
                            width: DoScreenAdapter.w(25),
                            height: DoScreenAdapter.h(25),
                            child: Image.network(element["image"])),
                        title: Text(element["title"]),
                        subtitle: Text(element["subTitle"]),
                        trailing: commonRoundCheckBox(
                            controller.selectedCreditProductIndex.value ==
                                element["id"], onTap: (selected) {
                          controller.changeCreditProductIndex(element["id"]);
                        }),
                      ),
                    ))
                .toList(),
          ]),
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
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: DoScreenAdapter.bottomH()),
            padding: EdgeInsets.symmetric(
                horizontal: DoScreenAdapter.w(20),
                vertical: DoScreenAdapter.h(10)),
            child: InkWell(
              onTap: () {
                Get.toNamed("/order-list");
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [DoColors.redBegin, DoColors.redEnd]),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "确认支付",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                          color: Colors.white),
                    ),
                    Text(
                      "￥",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(10),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "389494",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
