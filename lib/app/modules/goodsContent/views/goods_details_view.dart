import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';

class GoodsDetailsView extends GetView {
  const GoodsDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      width: double.infinity,
      height: DoScreenAdapter.h(1000),
      child: Text("详情"),
    );
  }
}
