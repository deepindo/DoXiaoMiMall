import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/goods_content_controller.dart';

class GoodsContentDetailsView extends GetView {
  @override
  final GoodsContentController controller = Get.find();
  final Function subHeader;
  GoodsContentDetailsView(this.subHeader, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk1,
      color: Colors.purple,
      width: double.infinity,
      height: DoScreenAdapter.h(2000),
      child: Column(
        children: [subHeader()],
      ),
    );
  }
}
