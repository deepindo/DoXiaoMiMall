import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';

class GoodsContentInfoView extends GetView {
  const GoodsContentInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // key: controller.gk1 ,
      color: Colors.orange,
      width: double.infinity,
      height: DoScreenAdapter.h(1000),
      child: Text("商品"),
    );
  }
}
