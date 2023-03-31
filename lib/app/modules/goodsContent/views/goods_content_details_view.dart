import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
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
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          subHeader(),
          _htmlWidget(),
        ],
      ),
    );
  }

  Widget _htmlWidget() {
    return Obx(() {
      ///预处理数据
      String? data;
      int index = controller.selectedSubTabsIndex.value;
      if (index == 0) {
        data = controller.model.value.content;
      } else if (index == 1) {
        data = controller.model.value.specs;
      } else if (index == 2) {
        ///可能有第三种
      } else {}

      return Html(
        shrinkWrap: true,
        data: data ?? "",
        style: {
          "body": Style(backgroundColor: Colors.white),

          ///段落标签，默认不处理，在安卓手机上会显示一块空白，Display.inline显示成一条线，基本看不见
          "p": Style(
              backgroundColor: Colors.white,
              display: Display.inline,
              fontSize: FontSize(DoScreenAdapter.fs(12))),
          "span": Style(
              backgroundColor: Colors.white,
              fontSize: FontSize(DoScreenAdapter.fs(12))),

          ///分行标签，默认不处理，在安卓手机上会显示大块空白，Display.none
          "br": Style(backgroundColor: Colors.white, display: Display.none),
        },
      );
    });
  }
}
