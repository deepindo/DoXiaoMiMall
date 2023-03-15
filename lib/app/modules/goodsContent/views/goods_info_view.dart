import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';

class GoodsInfoView extends GetView {
  const GoodsInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // key: controller.gk1 ,
      color: Colors.cyan,
      width: double.infinity,
      height: DoScreenAdapter.h(1000),
      child: Text("商品"),
    );
  }
}
