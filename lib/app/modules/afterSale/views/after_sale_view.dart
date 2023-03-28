import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/app_components.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/after_sale_controller.dart';

class AfterSaleView extends GetView<AfterSaleController> {
  const AfterSaleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: _body(),
    );
  }

  ///自定义appBar
  PreferredSizeWidget _customAppBar() {
    return AppBar(
      title: const Text('售后服务'),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.2,
      bottom: TabBar(
        tabs: controller.tabBarList,
        labelColor: DoColors.theme,
        unselectedLabelColor: DoColors.black128,
        labelStyle: TextStyle(
            fontSize: DoScreenAdapter.fs(14), fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
            fontSize: DoScreenAdapter.fs(14), fontWeight: FontWeight.normal),
        indicatorColor: DoColors.theme,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3,
        onTap: (value) {
          print("ontap${value}");
        },
        controller: controller.tabController,
        isScrollable: false,
      ),
    );
  }

  ///body部分
  Widget _body() {
    return TabBarView(
      controller: controller.tabController,
      children: [
        _applyListView(),
        _processCheckListView(),
      ],
    );
  }

  ///售后申请
  Widget _applyListView() {
    return commonEmptyView("暂无售后申请");
  }

  ///进度查询
  Widget _processCheckListView() {
    return commonEmptyView("暂无");
  }
}
