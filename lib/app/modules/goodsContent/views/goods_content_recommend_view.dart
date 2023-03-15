import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';

class GoodsContentRecommendView extends GetView {
  const GoodsContentRecommendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      width: double.infinity,
      height: DoScreenAdapter.h(1000),
      child: Text("推荐"),
    );
  }
}
