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
      endDrawer: const Drawer(),
      body: Obx(() =>
          // controller.goodsList.isNotEmpty
          //     ?
          Stack(
            children: [_listView(), _listHeader()],
            // children: [const Center(child: Text("没有更多数据了")), _listHeader()],
          )),
      // : _loadMoreDataIndicator()), //没有数据的时候添加
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
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

  /// 加载动画控件--临时用
  // Widget _loadMoreDataIndicator() {
  //   return controller.isHaveData.value
  //       ? const Center(
  //           child: CircularProgressIndicator(),
  //         )
  //       : const Center(child: Text("没有更多数据了"));
  // }

  /// 列表头
  Widget _listHeader() {
    return Positioned(
      left: 0,
      top: 0,
      // right: 0,
      width: DoScreenAdapter.sw(),
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
                      controller.changeHeaderId(element["id"]);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, //这是内部文字与图标的
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${element["title"]}",
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: controller.selectHeaderId.value ==
                                      element["id"]
                                  ? DoColors.theme
                                  : Colors.black54),
                        ),
                        _showIcon(element["id"]),
                      ],
                    ),
                  ));
            }).toList(),
            // [
            //   Expanded(
            //       flex: 1,
            //       child: InkWell(
            //         onTap: () {
            //           // print("object");
            //         },
            //         child: const Text(
            //           "综合",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(fontSize: 14, color: DoColors.theme),
            //         ),
            //       )),
            //   Expanded(
            //       flex: 1,
            //       child: InkWell(
            //         onTap: () {},
            //         child: const Text(
            //           "销量",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontSize: 14,
            //           ),
            //         ),
            //       )),
            //   Expanded(
            //       flex: 1,
            //       child: InkWell(
            //         onTap: () {},
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Text(
            //               "价格",
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontSize: 14,
            //               ),
            //             ),
            //             Icon(Icons.arrow_drop_down_outlined),
            //           ],
            //         ),
            //       )),
            //   Expanded(
            //       flex: 1,
            //       child: InkWell(
            //         onTap: () {},
            //         child: const Text(
            //           "新品优先",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontSize: 14,
            //           ),
            //         ),
            //       )),
            //   Expanded(
            //       flex: 1,
            //       child: InkWell(
            //         onTap: () {
            //           ///打开scaffold上面的endDrawer
            //           controller.scaffoldGlobalKey.currentState!.openEndDrawer();
            //         },
            //         child: const Text(
            //           "筛选",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontSize: 14,
            //           ),
            //         ),
            //       )),
            // ],
          ),
        ),
      ),
    );
  }

  Widget _showIcon(int id) {
    if (id == 1 ||
        id == 2 ||
        controller.currentHeaderSort.value == 1 ||
        controller.currentHeaderSort.value == -1) {
      return controller.headerMapList[id]["sort"] == -1
          ? const Icon(Icons.arrow_drop_up)
          : const Icon(Icons.arrow_drop_down);
    } else {
      return const SizedBox(
        width: 0,
      );
    }
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
