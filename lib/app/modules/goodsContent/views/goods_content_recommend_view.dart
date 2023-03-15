import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/goods_content_controller.dart';

class GoodsContentRecommendView extends GetView {
  @override
  final GoodsContentController controller = GoodsContentController();

  GoodsContentRecommendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      color: Colors.cyan,
      width: double.infinity,
      height: DoScreenAdapter.h(1000),
      child: Text("推荐"),
    );
  }
}
