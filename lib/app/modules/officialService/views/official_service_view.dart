import 'package:doxiaomimall/app/services/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/official_service_controller.dart';

class OfficialServiceView extends GetView<OfficialServiceController> {
  const OfficialServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoColors.gray249,
      appBar: _customAppBar(),
      body: _body(),
    );
  }

  ///自定义的appBar
  AppBar _customAppBar() {
    return AppBar(
      title: Text(
        '官网服务',
        style: TextStyle(
            fontSize: DoScreenAdapter.fs(16), fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black87,
              size: 20,
            )),
      ],
    );
  }

  Widget _body() {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(
            DoScreenAdapter.w(10),
            DoScreenAdapter.h(10),
            DoScreenAdapter.w(10),
            DoScreenAdapter.h(10)),
        itemCount: controller.serviceList.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) =>
            _listViewItem(controller.serviceList[index]));
  }

  Widget _listViewItem(Map itemMap) {
    return Container(
      margin: EdgeInsets.only(bottom: DoScreenAdapter.h(10)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(DoScreenAdapter.w(10)),
            child: Text(
              "${itemMap["title"]}",
              style: TextStyle(
                  fontSize: DoScreenAdapter.fs(14),
                  fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
            padding: EdgeInsets.all(DoScreenAdapter.w(10)),
            itemCount: itemMap["list"].length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis
                .vertical, //这里改成水平方向排布，下面cross就要改成2，与本方向垂直,这里与服务页用了两种不同的实现方式
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: DoScreenAdapter.w(10),
                crossAxisSpacing: DoScreenAdapter.w(10),
                childAspectRatio: 1),
            itemBuilder: (context, i) => _gridViewItem(itemMap["list"][i]),
          ),
        ],
      ),
    );
  }

  Widget _gridViewItem(Map itemMap) {
    return InkWell(
      onTap: () {
        ///使用唯一的标识符，因为名称和图标有可能更换
        print("点了-->${itemMap["title"]}");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(itemMap["icon"], color: itemMap["color"]),
          SizedBox(
            height: DoScreenAdapter.h(10),
          ),
          Text(itemMap["title"],
              style: TextStyle(fontSize: DoScreenAdapter.fs(12))),
        ],
      ),
    );
  }
}
