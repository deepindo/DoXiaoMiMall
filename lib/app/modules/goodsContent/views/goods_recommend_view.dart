import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';

class GoodsRecommendView extends GetView {
  const GoodsRecommendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      width: double.infinity,
      height: DoScreenAdapter.h(1000),
      child: Text("推荐"),
    );
  }
}
