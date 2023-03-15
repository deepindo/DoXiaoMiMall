// import 'package:doxiaomimall/app/services/app_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/goods_content_controller.dart';
import '../views/goods_content_info_view.dart';
import '../views/goods_content_details_view.dart';
import '../views/goods_content_recommend_view.dart';

class GoodsContentView extends GetView<GoodsContentController> {
  const GoodsContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, //实现透明导航栏
        appBar: _customAppBar(),
        body: Stack(
          children: [_singleChildScrollView(), _bottomFloatingView()],
        ));
  }

  ///自定义appBar
  PreferredSize _customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(DoScreenAdapter.h(44)),
      child: Obx(
        () => AppBar(
          backgroundColor: Colors.white.withOpacity(controller.opacity.value),
          elevation: 0,
          title: _customTabs(),
          centerTitle: true,
          leading:
              _circleBorderButton(Icons.arrow_back_ios_new_outlined, () {}),
          actions: [
            _circleBorderButton(Icons.file_upload_outlined, () {}),
            _circleBorderButton(Icons.more_horiz, () {
              _showMenuFunction();
              // showMenu(context: context, position: position, items: items)
            }),
          ],
        ),
      ),
    );
  }

  ///自定义标题
  Widget _customTabs() {
    return SizedBox(
      width: DoScreenAdapter.w(130), //设置后才可以居中
      height: DoScreenAdapter.h(44),
      child: Obx(
        () => controller.showTabs.value
            ? Row(
                children: controller.tabsList
                    .map(
                      (e) => Expanded(
                          child: InkWell(
                        onTap: () {
                          controller.changeTabsSelectedIndex(e["id"]);
                          Scrollable.ensureVisible(
                              controller.gk1.currentContext as BuildContext,
                              duration: const Duration(milliseconds: 100));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${e["title"]}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: DoScreenAdapter.h(5)),
                              width: DoScreenAdapter.w(15),
                              height: DoScreenAdapter.h(3),
                              color:
                                  controller.selectedTabsIndex.value == e["id"]
                                      ? Colors.orange
                                      : Colors.transparent,
                            )
                          ],
                        ),
                      )),
                    )
                    .toList(),
              )
            : const Text(""),
        // const SizedBox(
        //     width: 0,
        //     height: 0,
        //   ),
      ),
    );
  }

  ///圆边按钮
  Widget _circleBorderButton(IconData? icon, void Function()? onPressed) {
    return Container(
      width: DoScreenAdapter.w(40),
      height: DoScreenAdapter.w(40),
      // color: Colors.orange,
      margin: EdgeInsets.symmetric(
          horizontal: DoScreenAdapter.w(10)), //设置好这个后，左边返回按钮就左右往内压
      // margin: EdgeInsets.only(right: DoScreenAdapter.w(10)),
      padding: EdgeInsets.all(
          DoScreenAdapter.w(5)), //宽高大点，再加这样的padding内边距相当于视觉小点，热区大点
      child: ElevatedButton(
        style: ButtonStyle(
            alignment: Alignment.center,
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor:
                MaterialStateProperty.all(Colors.black.withOpacity(0.4)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(const CircleBorder())),
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }

  ///_singleChildScrollView
  Widget _singleChildScrollView() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          GoodsContentInfoView(),
          GoodsContentDetailsView(),
          GoodsContentRecommendView(),
        ],
      ),
    );
  }

  Widget _bottomFloatingView() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        //外层适应适配大的
        height: (DoScreenAdapter.h(49) + DoScreenAdapter.h(34)),
        color: Colors.white,
        // height: (DoScreenAdapter.h(64) + DoScreenAdapter.bh()),
        child: Container(
          //内层实际显示小的
          height: DoScreenAdapter.h(49),
          margin: EdgeInsets.fromLTRB(
            DoScreenAdapter.w(0),
            DoScreenAdapter.h(0),
            DoScreenAdapter.w(0),
            DoScreenAdapter.h(34) + DoScreenAdapter.h(0),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                //顶部边线
                top: BorderSide(
                  width: DoScreenAdapter.h(0.5),
                  color: Colors.black12,
                ),
              )),

          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,//不生效
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                padding: EdgeInsets.fromLTRB(
                  DoScreenAdapter.w(8),
                  DoScreenAdapter.h(10),
                  DoScreenAdapter.w(8),
                  DoScreenAdapter.h(10),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.headset_mic_rounded,
                      color: Colors.black54,
                      size: 20,
                    ),
                    Text(
                      "客服",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black87),
                    )
                  ],
                ),
              ),
              Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                padding: EdgeInsets.fromLTRB(
                  DoScreenAdapter.w(8),
                  DoScreenAdapter.h(10),
                  DoScreenAdapter.w(8),
                  DoScreenAdapter.h(10),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black54,
                      size: 20,
                    ),
                    Text(
                      "收藏",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black87),
                    )
                  ],
                ),
              ),
              Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                padding: EdgeInsets.fromLTRB(
                  DoScreenAdapter.w(8),
                  DoScreenAdapter.h(10),
                  DoScreenAdapter.w(8),
                  DoScreenAdapter.h(10),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      color: Colors.black54,
                      size: 20,
                    ),
                    Text(
                      "购物车",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black87),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                      DoScreenAdapter.w(8),
                      DoScreenAdapter.h(10),
                      DoScreenAdapter.w(0),
                      DoScreenAdapter.h(10),
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    alignment: Alignment.center,
                    child: Text(
                      "加入购物车",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: DoScreenAdapter.fs(13)),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                      DoScreenAdapter.w(0),
                      DoScreenAdapter.h(10),
                      DoScreenAdapter.w(10),
                      DoScreenAdapter.h(10),
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    alignment: Alignment.center,
                    child: Text(
                      "立即购买",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: DoScreenAdapter.fs(13)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  ///更多菜单框
  void _showMenuFunction() {
    showMenu(
      context: Get.context!,
      position: RelativeRect.fromLTRB(
        DoScreenAdapter.sw(),
        DoScreenAdapter.h(64 + 24), //24是适配刘海屏的
        DoScreenAdapter.w(20),
        DoScreenAdapter.h(0),
      ),
      clipBehavior: Clip.hardEdge, //有啥区别呢？
      color: Colors.black.withOpacity(0.4),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.fromLTRB(
            DoScreenAdapter.w(10),
            DoScreenAdapter.h(0),
            DoScreenAdapter.w(5),
            DoScreenAdapter.h(0),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.home_rounded,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: DoScreenAdapter.w(10)),
              const Text(
                "首页",
                style: TextStyle(fontSize: 13, color: Colors.white),
              )
            ],
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.fromLTRB(
            DoScreenAdapter.w(10),
            DoScreenAdapter.h(0),
            DoScreenAdapter.w(5),
            DoScreenAdapter.h(0),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.message_outlined,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: DoScreenAdapter.w(10)),
              const Text(
                "消息通知",
                style: TextStyle(fontSize: 13, color: Colors.white),
              )
            ],
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.fromLTRB(
            DoScreenAdapter.w(10),
            DoScreenAdapter.h(0),
            DoScreenAdapter.w(5),
            DoScreenAdapter.h(0),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.favorite_border_outlined,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: DoScreenAdapter.w(10)),
              const Text(
                "收藏的商品",
                style: TextStyle(fontSize: 13, color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
