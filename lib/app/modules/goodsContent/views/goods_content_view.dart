// import 'package:doxiaomimall/app/services/app_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import '../../../services/app_network.dart';
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
          leading: _circleBorderButton(Icons.arrow_back_ios_new_outlined, () {
            Get.back();
          }),
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

                          if (e["id"] == 0) {
                            Scrollable.ensureVisible(
                                controller.gk0.currentContext as BuildContext,
                                duration: const Duration(milliseconds: 100));
                          } else if (e["id"] == 1) {
                            Scrollable.ensureVisible(
                                controller.gk1.currentContext as BuildContext,
                                duration: const Duration(milliseconds: 100));
                          } else if (e["id"] == 2) {
                            Scrollable.ensureVisible(
                                controller.gk2.currentContext as BuildContext,
                                duration: const Duration(milliseconds: 100));
                          }
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
          GoodsContentInfoView(showSelectedBottomSheet),
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
                  DoScreenAdapter.h(5),
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
                  DoScreenAdapter.h(5),
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
                  DoScreenAdapter.h(5),
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
                  child: InkWell(
                    onTap: showSelectedBottomSheet,
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
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: showSelectedBottomSheet,
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
        DoScreenAdapter.h(64 + 24 - 16), //24是适配刘海屏的,10是为了微调的
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

  ///已选点击弹框
  void showSelectedBottomSheet() {
    Get.bottomSheet(
      isScrollControlled: true, //设置完这个，上面设置的超过半屏的高度才会生效，否则默认最高半屏

      ///Get.bottomSheet中要使用响应式只能使用GetBuilder，而不能使用Obx了
      GetBuilder<GoodsContentController>(
        init: controller,
        builder: (controller) {
          return Container(
            width: DoScreenAdapter.sw(),
            height: DoScreenAdapter.h(400),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(DoScreenAdapter.w(10)),
                topRight: Radius.circular(DoScreenAdapter.w(10)),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(DoScreenAdapter.w(10)),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 0.5, color: Colors.black12))),
                    child: Row(
                      children: [
                        SizedBox(
                            width: DoScreenAdapter.w(80),
                            height: DoScreenAdapter.w(80),
                            child: Image.network(
                              DoNetwork.replacePictureURL(
                                  "${controller.model.value.pic}"),
                              // "https://www.itying.com/images/b_focus01.png",
                              fit: BoxFit.cover,
                            )),
                        SizedBox(width: DoScreenAdapter.w(10)),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("¥${controller.model.value.price}",
                                // "¥1599",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w900,
                                    fontSize: DoScreenAdapter.fs(16))),
                            SizedBox(height: DoScreenAdapter.h(10)),
                            Text("${controller.model.value.title}",
                                // "Redmi Note 12 Pro",
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: DoScreenAdapter.fs(12))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: DoScreenAdapter.h(70),
                  bottom: (DoScreenAdapter.h(49) + DoScreenAdapter.h(34)),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                      DoScreenAdapter.w(10),
                      DoScreenAdapter.h(10),
                      DoScreenAdapter.w(10),
                      DoScreenAdapter.h(10),
                    ),
                    children: controller.model.value.attr!.map(
                      (e) {
                        print("---${e.selectedStr}");
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: DoScreenAdapter.h(10)),
                            Text(
                              "${e.cate}",
                              // "版本",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DoScreenAdapter.fs(12)),
                            ),
                            SizedBox(height: DoScreenAdapter.h(10)),
                            Wrap(
                              spacing: DoScreenAdapter.h(10),
                              runSpacing: DoScreenAdapter.w(10),
                              children: e.list!.map((v) {
                                return _commonSelectWidget(
                                    title: v,
                                    // "6GB+128GB",
                                    onTap: () {
                                      print("点中了---$v");
                                      //改变选中数据
                                      e.selectedStr = v;
                                      controller.changeSelectedTags();
                                    },
                                    isSelected: v == e.selectedStr);
                              }).toList(),
                              // [
                              ///Chip
                              ///InputChip
                              ///ChoiceChip
                              ///FilterChip
                              ///ActionChip
                              // Container(
                              //   // padding: EdgeInsets.all(5),
                              //   // margin: EdgeInsets.all(5),
                              //   child: Chip(
                              //     // avatar: const Icon(
                              //     //   Icons.av_timer,
                              //     //   size: 20,
                              //     // ),
                              //     side: const BorderSide(color: Colors.red, width: 0.5),
                              //     shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(5)),
                              //     backgroundColor:
                              //         const Color.fromRGBO(248, 248, 248, 1),
                              //     labelPadding: const EdgeInsets.all(0),
                              //     // padding: const EdgeInsets.symmetric(horizontal: 2),
                              //     // visualDensity: const VisualDensity(vertical: 0), //不生效
                              //     padding: EdgeInsets.all(0),
                              //     label: Text("测试chip",
                              //         style:
                              //             TextStyle(fontSize: DoScreenAdapter.fs(12))),
                              //     // onDeleted: () {},
                              //     // deleteIcon: const Icon(
                              //     //   Icons.delete,
                              //     //   size: 15,
                              //     // ),
                              //   ),
                              // ),
                              // _commonSelectWidget(
                              //     title: "6GB+128GB", isSelected: true),
                              // _commonSelectWidget(title: "8GB+128GB"),
                              // ],
                            ),
                          ],
                        );
                      },
                    ).toList(),

                    // [
                    //   SizedBox(height: DoScreenAdapter.h(10)),
                    //   Text(
                    //     "版本",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: DoScreenAdapter.fs(12)),
                    //   ),
                    //   SizedBox(height: DoScreenAdapter.h(10)),
                    //   Wrap(
                    //     spacing: DoScreenAdapter.h(10),
                    //     runSpacing: DoScreenAdapter.w(10),
                    //     children: [
                    //       ///Chip
                    //       ///InputChip
                    //       ///ChoiceChip
                    //       ///FilterChip
                    //       ///ActionChip
                    //       // Container(
                    //       //   // padding: EdgeInsets.all(5),
                    //       //   // margin: EdgeInsets.all(5),
                    //       //   child: Chip(
                    //       //     // avatar: const Icon(
                    //       //     //   Icons.av_timer,
                    //       //     //   size: 20,
                    //       //     // ),
                    //       //     side: const BorderSide(color: Colors.red, width: 0.5),
                    //       //     shape: RoundedRectangleBorder(
                    //       //         borderRadius: BorderRadius.circular(5)),
                    //       //     backgroundColor:
                    //       //         const Color.fromRGBO(248, 248, 248, 1),
                    //       //     labelPadding: const EdgeInsets.all(0),
                    //       //     // padding: const EdgeInsets.symmetric(horizontal: 2),
                    //       //     // visualDensity: const VisualDensity(vertical: 0), //不生效
                    //       //     padding: EdgeInsets.all(0),
                    //       //     label: Text("测试chip",
                    //       //         style:
                    //       //             TextStyle(fontSize: DoScreenAdapter.fs(12))),
                    //       //     // onDeleted: () {},
                    //       //     // deleteIcon: const Icon(
                    //       //     //   Icons.delete,
                    //       //     //   size: 15,
                    //       //     // ),
                    //       //   ),
                    //       // ),
                    //       _commonSelectWidget(title: "6GB+128GB", isSelected: true),
                    //       _commonSelectWidget(title: "8GB+128GB"),
                    //     ],
                    //   ),
                    //   SizedBox(height: DoScreenAdapter.h(10)),
                    //   Text(
                    //     "颜色",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: DoScreenAdapter.fs(12)),
                    //   ),
                    //   SizedBox(height: DoScreenAdapter.h(10)),
                    //   Wrap(
                    //     spacing: DoScreenAdapter.h(10),
                    //     runSpacing: DoScreenAdapter.w(10),
                    //     children: [
                    //       _commonSelectWidget(title: "清凉薄荷", isSelected: true),
                    //       _commonSelectWidget(title: "冰峰黑提"),
                    //       _commonSelectWidget(title: "晴光白雪"),
                    //       _commonSelectWidget(title: "樱花蜜粉"),
                    //       _commonSelectWidget(title: "清凉薄荷"),
                    //       _commonSelectWidget(title: "冰峰黑提"),
                    //       _commonSelectWidget(title: "晴光白雪"),
                    //       _commonSelectWidget(title: "樱花蜜粉"),
                    //       _commonSelectWidget(title: "清凉薄荷"),
                    //       _commonSelectWidget(title: "冰峰黑提"),
                    //       _commonSelectWidget(title: "晴光白雪"),
                    //       _commonSelectWidget(title: "樱花蜜粉"),
                    //       _commonSelectWidget(title: "清凉薄荷"),
                    //       _commonSelectWidget(title: "冰峰黑提"),
                    //       _commonSelectWidget(title: "晴光白雪"),
                    //       _commonSelectWidget(title: "樱花蜜粉"),
                    //       _commonSelectWidget(title: "清凉薄荷"),
                    //       _commonSelectWidget(title: "冰峰黑提"),
                    //       _commonSelectWidget(title: "晴光白雪"),
                    //       _commonSelectWidget(title: "樱花蜜粉")
                    //     ],
                    //   ),
                    // ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  // height: DoScreenAdapter.h(80),
                  child: Container(
                    // color: Colors.purple,
                    height: (DoScreenAdapter.h(49) + DoScreenAdapter.h(34)),
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
                          // color: Colors.white,
                          border: Border(
                        //顶部边线
                        top: BorderSide(
                          width: DoScreenAdapter.h(0.5),
                          color: Colors.black12,
                        ),
                      )),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
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
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                ///这个关闭按钮要最后添加,若是先加，可能被其他Positioned的组件遮盖，点击事件无法响应
                Positioned(
                    right: DoScreenAdapter.w(5),
                    top: DoScreenAdapter.h(5),
                    child: InkWell(
                      onTap: () {
                        print("Get.back()");
                        Get.back();
                      },
                      child: const SizedBox(
                        // alignment: Alignment.center,
                        // color: Colors.orange,
                        child: Icon(
                          Icons.close,
                          size: 20,
                        ),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }

  ///抽取了一个选择字段组件
  Widget _commonSelectWidget(
      {required String title,
      // required bool isSelected,//需要设置false的多，所以如下了
      bool isSelected = false,
      Function()? onTap}) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          onTap!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(248, 248, 248, 1),
            borderRadius: BorderRadius.circular(DoScreenAdapter.w(5)),
            border: Border.fromBorderSide(BorderSide(
                width: DoScreenAdapter.w(0.5),
                color: isSelected
                    ? Colors.red
                    : const Color.fromRGBO(248, 248, 248, 1)))),
        padding: EdgeInsets.fromLTRB(DoScreenAdapter.w(10),
            DoScreenAdapter.h(5), DoScreenAdapter.w(10), DoScreenAdapter.h(5)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 12, color: isSelected ? Colors.red : Colors.black87),
        ),
      ),
    );
  }
}
