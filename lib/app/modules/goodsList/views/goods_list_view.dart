import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/goods_list_controller.dart';
import '../../../services/app_screenAdapter.dart';
import '../../../services/app_fontIcons.dart';
import '../../../services/app_network.dart';

class GoodsListView extends GetView<GoodsListController> {
  const GoodsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: Stack(
        children: [_listView(), _listHeader()],
      ),
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
    );
  }

  /// 自定义的appBar
  AppBar _customAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              DoFontIcons.message,
              color: Colors.black87,
            )),
      ],
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: DoScreenAdapter.w(300),
        height: DoScreenAdapter.h(26),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                  "搜索",
                  style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14),
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 列表头
  Widget _listHeader() {
    return Positioned(
      left: 0,
      top: 0,
      right: 0,
      child: Container(
        // width: DoScreenAdapter.sw(),//可以不设置
        height: DoScreenAdapter.h(40),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: DoScreenAdapter.h(0.5), color: Colors.black12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, //不起作用
          children: [
            const Expanded(
                flex: 1,
                child: Text(
                  "综合",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                )),
            const Expanded(
                flex: 1,
                child: Text(
                  "销量",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "价格",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    Icon(Icons.arrow_drop_down_outlined),
                  ],
                )),
            const Expanded(
                flex: 1,
                child: Text(
                  "新品优先",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                )),
            Container(
              width: DoScreenAdapter.w(1),
              height: DoScreenAdapter.h(10),
              color: Colors.black12,
            ),
            const Expanded(
                flex: 1,
                child: Text(
                  "筛选",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                )),
          ],
        ),
      ),
    );
  }

  /// 列表页
  Widget _listView() {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.only(top: DoScreenAdapter.h(50)),
        itemCount: controller.goodsList.length,
        itemBuilder: (context, index) {
          return Container(
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
                        child: Text("¥${controller.goodsList[index].price}起",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.red,
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
                          style: TextStyle(fontSize: 10, color: Colors.black26),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
