import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../services/app_colors.dart';
import '../controllers/goods_list_controller.dart';
import '../../../services/app_screenAdapter.dart';
import '../../../services/app_network.dart';

class GoodsListView extends GetView<GoodsListController> {
  const GoodsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldGlobalKey,
      appBar: _customAppBar(),
      endDrawer: _filterDrawer(),
      body: Obx(() =>
          // controller.goodsList.isNotEmpty
          //     ?
          Stack(
            children: [
              _listView(),
              _topSheet(),
              _listHeader(),
            ],
            // children: [const Center(child: Text("没有更多数据了")), _listHeader()],
          )),
      // : _loadMoreDataIndicator()), //没有数据的时候添加
      backgroundColor: DoColors.gray249,
    );
  }

  /// 自定义的appBar
  AppBar _customAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: const [Text("")], //写这个单纯是为了让endDrawer消失，但实际功能还存在，通过globalKey来调用
      title: InkWell(
        onTap: () {
          Get.offAndToNamed("/search");
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: DoScreenAdapter.w(300),
          height: DoScreenAdapter.h(26),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.search,
                color: Colors.black26,
                size: 20,
              ),
              SizedBox(
                width: DoScreenAdapter.w(5),
              ),
              Text(
                controller.searchWords != null
                    ? "${controller.searchWords}"
                    : "",
                style: TextStyle(
                  fontSize: DoScreenAdapter.fs(14),
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 列表头
  Widget _listHeader() {
    return Positioned(
      left: 0,
      top: 0,
      width: DoScreenAdapter.screenW(),
      child: Obx(
        () => Container(
          height: DoScreenAdapter.h(40),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: DoScreenAdapter.h(0.5), color: Colors.black12))),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, //基本不生效了，外层了5个expanded之间的
            crossAxisAlignment: CrossAxisAlignment.center, //垂直方向
            children: controller.headerMapList.map((element) {
              return Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      if (element["id"] == 0 || element["id"] == 1) {
                        controller.closeSortPrice();
                        controller.changeHeaderId(element["id"]);
                      } else if (element["id"] == 2) {
                        controller.openSortPrice();
                        controller.changeHeaderId(element["id"]);
                      } else if (element["id"] == 4) {
                        controller.scaffoldGlobalKey.currentState!
                            .openEndDrawer();
                      } else {
                        controller.showTopSheet();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.zero,
                      height: DoScreenAdapter.h(40),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, //这是内部文字与图标的
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${element["title"]}",
                            style: TextStyle(
                                fontSize: 14,
                                color: controller.selectHeaderId.value ==
                                        element["id"]
                                    ? DoColors.theme
                                    : Colors.black54),
                          ),
                          _trailingWidget(element["id"]),
                        ],
                      ),
                    ),
                  ));
            }).toList(),
          ),
        ),
      ),
    );
  }

  // Widget _topSheet() {
  //   return Positioned(
  //       left: 0,
  //       right: 0,
  //       top: 0,
  //       height: DoScreenAdapter.screenH(),
  //       child: Container(
  //         alignment: Alignment.topCenter,
  //         color: Colors.cyan,
  //         // height: DoScreenAdapter.screenH(),
  //         // width: double.infinity,
  //         child: Container(
  //           color: Colors.purple,
  //           width: double.infinity,
  //           height: DoScreenAdapter.h(150),
  //         ),
  //       ));
  // }

  ///顶部弹出框
  Widget _topSheet() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      height: DoScreenAdapter.screenH(),
      child: AnimatedContainer(
        onEnd: () {
          controller.showTopSheetCover();
        },
        // color: Colors.black.withOpacity(0.2),
        alignment: Alignment.topCenter,
        height: DoScreenAdapter.screenH(),
        duration: const Duration(seconds: 1, milliseconds: 100),
        transform: controller.isShowTopSheet.value
            ? Matrix4.translationValues(0, DoScreenAdapter.h(40), 0)
            : Matrix4.translationValues(0, -DoScreenAdapter.screenH(), 0),
        child: Column(
          children: [
            Container(
              color: DoColors.gray249,
              alignment: Alignment.topCenter,
              height: DoScreenAdapter.h(180),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: DoScreenAdapter.h(40),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: DoScreenAdapter.h(30),
                              padding: EdgeInsets.symmetric(
                                  horizontal: DoScreenAdapter.h(10),
                                  vertical: DoScreenAdapter.w(0)),
                              // color: DoColors.gray249,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("集显$index",
                                      style: TextStyle(
                                          fontSize: DoScreenAdapter.fs(14))),
                                  Icon(Icons.check_outlined,
                                      size: DoScreenAdapter.fs(14),
                                      color: DoColors.gray238)
                                ],
                              ),
                            ),
                            Container(
                                color: DoColors.gray238,
                                height: DoScreenAdapter.h(0.5))
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      // color: DoColors.gray249,
                      height: DoScreenAdapter.h(40),
                      padding: EdgeInsets.symmetric(
                          horizontal: DoScreenAdapter.w(10),
                          vertical: DoScreenAdapter.h(5)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      DoScreenAdapter.w(20))),
                              child: Text("重置",
                                  style: TextStyle(
                                      // color: Colors.white,
                                      fontSize: DoScreenAdapter.fs(14))),
                            ),
                          ),
                          SizedBox(width: DoScreenAdapter.w(10)),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: DoColors.theme,
                                  borderRadius: BorderRadius.circular(
                                      DoScreenAdapter.w(20))),
                              child: Text("确定",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: DoScreenAdapter.fs(14))),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.showTopSheet();
                controller.showTopSheetCover();
              },
              child: AnimatedOpacity(
                onEnd: () {
                  // controller.showTopSheetCover();
                },
                curve: Curves.bounceInOut,
                opacity: controller.isShowCover.value ? 0.3 : 0,
                duration: const Duration(milliseconds: 100),
                child: Container(
                  height: DoScreenAdapter.screenH() - DoScreenAdapter.h(180),
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///价格指示图标
  Widget _trailingWidget(int id) {
    if (id == 2) {
      if (controller.isOpenSortPrice.value) {
        // return controller.headerMapList[id]["sort"] == -1
        //     ? const Icon(Icons.arrow_drop_up, color: DoColors.theme)
        //     : const Icon(Icons.arrow_drop_down, color: DoColors.theme);
        return controller.headerMapList[id]["sort"] == -1
            ? Padding(
                padding: EdgeInsets.all(DoScreenAdapter.w(5)),
                child: Image.asset("assets/icons/arrow_up_down_up.png",
                    width: DoScreenAdapter.w(10),
                    height: DoScreenAdapter.w(10)))
            : Padding(
                padding: EdgeInsets.all(DoScreenAdapter.w(5)),
                child: Image.asset("assets/icons/arrow_up_down_down.png",
                    width: DoScreenAdapter.w(10),
                    height: DoScreenAdapter.w(10)));
      } else {
        // return const Icon(Icons.double_arrow_sharp);
        return Padding(
          padding: EdgeInsets.all(DoScreenAdapter.w(5)),
          child: Image.asset("assets/icons/arrow_up_down_none.png",
              width: DoScreenAdapter.w(10), height: DoScreenAdapter.w(10)),
        );
      }
    } else {
      return const SizedBox(
        width: 0,
      );
    }
    // if (id == 1 ||
    //     id == 2 ||
    //     controller.currentHeaderSort.value == 1 ||
    //     controller.currentHeaderSort.value == -1) {
    //   return controller.headerMapList[id]["sort"] == -1
    //       ? const Icon(Icons.arrow_drop_up)
    //       : const Icon(Icons.arrow_drop_down);
    // } else {
    //   return const SizedBox(
    //     width: 0,
    //   );
    // }
  }

  ///筛选抽屉
  Widget _filterDrawer() {
    double w =
        (DoScreenAdapter.screenW() * 0.8 - DoScreenAdapter.w(10) * 4) / 3;
    double h = DoScreenAdapter.h(20);
    return GetBuilder<GoodsListController>(
        init: controller,
        builder: (controller) {
          return Drawer(
            backgroundColor: Colors.white,
            width: DoScreenAdapter.screenW() * 0.8,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  // top: 0,
                  top: DoScreenAdapter.statusH(),
                  bottom: DoScreenAdapter.adapterBottomH(),
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: DoScreenAdapter.w(10),
                        vertical: DoScreenAdapter.h(5),
                      ),
                      shrinkWrap: true,
                      itemCount: controller.filterWordsList.length,
                      itemBuilder: (context, index) {
                        ///取值
                        Map listItem = controller.filterWordsList[index];
                        bool unfold = listItem["unfold"];
                        List gridItemList = listItem["list"];

                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.white,
                                height: DoScreenAdapter.h(30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${listItem["title"]}",
                                        style: TextStyle(
                                            fontSize: DoScreenAdapter.fs(12),
                                            fontWeight: FontWeight.bold)),
                                    gridItemList.length > 3
                                        ? IconButton(
                                            onPressed: () {
                                              controller.unfoldFilter(index);
                                            },
                                            icon: Icon(
                                              unfold
                                                  ? Icons
                                                      .keyboard_arrow_up_outlined
                                                  : Icons
                                                      .keyboard_arrow_down_outlined,
                                              color: DoColors.gray168,
                                              size: 18,
                                            ))
                                        : const SizedBox(
                                            width: 0,
                                            height: 0,
                                          ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: GridView.builder(
                                    itemCount: unfold
                                        ? gridItemList.length
                                        : (gridItemList.length > 3
                                            ? 3
                                            : gridItemList.length),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    // padding: EdgeInsets.zero, //这个不设置，top默认有大间距
                                    padding: EdgeInsets.only(
                                        bottom: DoScreenAdapter.h(10)),
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: DoScreenAdapter.w(10),
                                      crossAxisSpacing: DoScreenAdapter.w(10),
                                      childAspectRatio: w / h,
                                    ),
                                    itemBuilder: (context, i) {
                                      ///取值
                                      Map gridItem = gridItemList[i];

                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: DoScreenAdapter.w(2)),
                                        decoration: BoxDecoration(
                                            color: DoColors.gray249,
                                            borderRadius: BorderRadius.circular(
                                                DoScreenAdapter.w(5))),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${gridItem["title"]}",
                                          softWrap: true,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: DoScreenAdapter.fs(12)),
                                        ),
                                      );
                                    }),
                              )
                            ]);
                      }),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: DoScreenAdapter.adapterBottomH(),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              top: BorderSide(
                                  width: 0.5, color: DoColors.gray238))),
                      child: Container(
                        color: Colors.white,
                        margin:
                            EdgeInsets.only(bottom: DoScreenAdapter.bottomH()),
                        padding: EdgeInsets.symmetric(
                            horizontal: DoScreenAdapter.w(10),
                            vertical: DoScreenAdapter.h(10)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Get.snackbar("提示", "重置");
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: DoColors.gray238,
                                      borderRadius: BorderRadius.circular(
                                          DoScreenAdapter.w(30))),
                                  child: Text("重置",
                                      style: TextStyle(
                                          color: DoColors.black128,
                                          fontSize: DoScreenAdapter.fs(13))),
                                ),
                              ),
                            ),
                            SizedBox(width: DoScreenAdapter.w(10)),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            DoColors.redBegin,
                                            DoColors.redEnd
                                          ]),
                                      borderRadius: BorderRadius.circular(
                                          DoScreenAdapter.w(30))),
                                  child: Text("确定",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: DoScreenAdapter.fs(13))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          );
        });
  }

  /// 列表页
  Widget _listView() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      // enableTwoLevel: true,
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      onLoading: controller.onLoad,
      // onTwoLevel: (isOpen) {},
      header: const WaterDropMaterialHeader(
        // semanticsLabel: "这里是啥",
        offset: 50,
        color: Colors.white,
        backgroundColor: DoColors.theme,
      ),
      footer: ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        idleText: "上拉加载~",
        canLoadingText: "松手，加载更多哦~",
        loadingText: "加载中...",
        noDataText: "没有数据~",
        spacing: 0,
        onClick: () {
          // print("ClassicFooter-onClick");
        },
      ),
      child: ListView.builder(
        controller: controller.scrollController,
        padding: EdgeInsets.only(
            top: DoScreenAdapter.h(50), bottom: DoScreenAdapter.h(20)),
        itemCount: controller.goodsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed("/goods-content", arguments: {
                "sid": controller.goodsList[index].sId,
                "isCanJumpCart": true,
              });
            },
            child: Column(children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    DoScreenAdapter.w(10),
                    DoScreenAdapter.h(0),
                    DoScreenAdapter.w(10),
                    DoScreenAdapter.h(10)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
                child: Row(
                  children: [
                    ///左侧图片
                    SizedBox(
                      width: DoScreenAdapter.w(120),
                      height: DoScreenAdapter.h(120),
                      child: Image.network(
                        DoNetwork.replacePictureURL(
                            controller.goodsList[index].pic!),
                        fit: BoxFit.fitHeight,
                      ),
                    ),

                    ///右侧
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                DoScreenAdapter.w(10),
                                DoScreenAdapter.h(10),
                                DoScreenAdapter.w(5),
                                DoScreenAdapter.h(0)),
                            child: Text(
                              "${controller.goodsList[index].title}",
                              style: TextStyle(
                                  fontSize: DoScreenAdapter.fs(14),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                DoScreenAdapter.w(10),
                                DoScreenAdapter.h(5),
                                DoScreenAdapter.w(5),
                                DoScreenAdapter.h(0)),
                            child: Text(
                              "${controller.goodsList[index].subTitle}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: DoScreenAdapter.fs(12),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                DoScreenAdapter.w(10),
                                DoScreenAdapter.h(5),
                                DoScreenAdapter.w(5),
                                DoScreenAdapter.h(0)),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: const [
                                        Text(
                                          "CPU",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Hello G25",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: DoScreenAdapter.w(1),
                                  height: DoScreenAdapter.h(10),
                                  color: Colors.black12,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: const [
                                        Text(
                                          "高清拍摄",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "1300万像素",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: DoScreenAdapter.w(1),
                                  height: DoScreenAdapter.h(10),
                                  color: Colors.black12,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: const [
                                        Text(
                                          "超大屏",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "6.6英寸",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                DoScreenAdapter.w(10),
                                DoScreenAdapter.h(10),
                                DoScreenAdapter.w(5),
                                DoScreenAdapter.h(0)),
                            child: Text(
                                "¥${controller.goodsList[index].price}起",
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: DoColors.theme,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                DoScreenAdapter.w(10),
                                DoScreenAdapter.h(10),
                                DoScreenAdapter.w(5),
                                DoScreenAdapter.h(10)),
                            child: const Text(
                              "11212条评价 99.8%满意",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black26),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              ///最后一个元素添加加载indicator
              ///index不是最后一个是，每个都加了一个空内容的text，会导致间距增加
              // (index == controller.goodsList.length - 1)
              //     ? _loadMoreDataIndicator()
              //     : const SizedBox(
              //         height: 0,
              //       ),
            ]),
          );
        },
      ),
    );
  }
}
