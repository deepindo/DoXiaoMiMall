import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../services/app_colors.dart';
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
          children: [
            _singleChildScrollView(),
            _bottomFloatingView(),
            _customSubHeaders(),
          ],
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
          title: _customHeader(),
          centerTitle: true,
          leading: _circleBorderButton(
              icon: Icons.arrow_back_ios_new_outlined,
              isBackButton: true,
              onPressed: () {
                Get.back();
              }),
          actions: [
            _circleBorderButton(
                icon: Icons.file_upload_outlined, onPressed: () {}),
            _circleBorderButton(
                icon: Icons.more_horiz,
                onPressed: () {
                  _showMenuFunction();
                }),
          ],
        ),
      ),
    );
  }

  ///自定义标题
  Widget _customHeader() {
    return SizedBox(
      width: DoScreenAdapter.w(140), //设置后才可以居中
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
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${e["title"]}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: controller.selectedTabsIndex.value ==
                                        e["id"]
                                    ? DoColors.theme
                                    : Colors.black,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: DoScreenAdapter.h(5)),
                              width: DoScreenAdapter.w(15),
                              height: DoScreenAdapter.h(3),
                              color:
                                  controller.selectedTabsIndex.value == e["id"]
                                      ? DoColors.theme
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

  ///当前用于本页面隐藏显示响应式的二级标题
  ///所有obx只能加在这里，不然会影响传到详情页面的显示
  Widget _customSubHeaders() {
    return Obx(
      () => controller.showSubTabs.value
          ? Positioned(
              left: 0,
              right: 0,
              top: DoScreenAdapter.h(44) + DoScreenAdapter.statush(),
              // -
              // DoScreenAdapter.h(0.5), //细微的差别，有条缝隙
              child: commonSubHeaders(),
            )
          : const Text(""),
    );
    // _customSubHeaders()
  }

  ///通用二级标题
  Widget commonSubHeaders() {
    return Obx(
      () => Container(
        color: Colors.white,
        height: DoScreenAdapter.h(30),
        child: Row(
          children: controller.subTabsList
              .map(
                (e) => Expanded(
                    child: InkWell(
                  onTap: () {
                    controller.changeSubTabsSelectedIndex(e["id"]);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${e["title"]}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: controller.selectedSubTabsIndex.value == e["id"]
                            ? DoColors.theme
                            : Colors.black,
                      ),
                    ),
                  ),
                )),
              )
              .toList(),
        ),
      ),
    );
  }

  ///圆边按钮
  Widget _circleBorderButton(
      {required IconData icon,
      bool isBackButton = false,
      Function()? onPressed}) {
    return Container(
      width: DoScreenAdapter.w(40),
      height: DoScreenAdapter.w(40),

      ///设置好这个后，左边返回按钮就左右往内压
      margin: isBackButton
          ? EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10))
          : EdgeInsets.only(right: DoScreenAdapter.w(10)),
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
          GoodsContentInfoView(showPrebuyBottomSheet),
          // GoodsContentInfoView(() => showPrebuyBottomSheet(sourceType: 0)),
          GoodsContentDetailsView(commonSubHeaders),
          GoodsContentRecommendView(),
        ],
      ),
    );
  }

  ///底部浮动操作区域-添加到购物车
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
              InkWell(
                onTap: () {
                  Get.toNamed("/customer-service");
                },
                child: Padding(
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
              ),
              InkWell(
                onTap: () {
                  EasyLoading.showToast("收藏成功，调接口图标变化");
                },
                child: Padding(
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
              ),
              InkWell(
                onTap: () {
                  ///这个地方要加判断，有些来源可以进购物车，有些不行
                  ///比如购物车下面“猜你喜欢的”列表，可以添加，购买，就是不能直接进入购物车
                  ///所以此处要
                  if (controller.isCanJumpCart) {
                    Get.toNamed("/cart", arguments: {"jumpSource": "outer"});
                  }
                },
                child: Padding(
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
              ),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      showPrebuyBottomSheet(sourceType: 1);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        DoScreenAdapter.w(8),
                        DoScreenAdapter.h(10),
                        DoScreenAdapter.w(0),
                        DoScreenAdapter.h(10),
                      ),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                DoColors.yellowBegin,
                                DoColors.yellowEnd
                              ]),
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
                      showPrebuyBottomSheet(sourceType: 2);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        DoScreenAdapter.w(0),
                        DoScreenAdapter.h(10),
                        DoScreenAdapter.w(10),
                        DoScreenAdapter.h(10),
                      ),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                DoColors.redBegin,
                                DoColors.redEnd,
                              ]),
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

  ///卖之前的弹框:
  ///sourceType：点击的来源
  ///0: 已选
  ///1: 加入购物车
  ///2: 立即购买
  void showPrebuyBottomSheet({int? sourceType = 0}) {
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
                                    color: DoColors.theme,
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
                      children: [
                        ///用...可以合并数据，
                        ///这个非常重要
                        ...controller.model.value.attr!.map(
                          (e) {
                            // print("---${e.selectedStr}");
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
                                          e.selectedStr =
                                              v; //为何不把这个放到下面方法里面，因为刚好上面两个map直接可以定位，反之要嵌套循环，就很麻烦了
                                          controller.changeSelectedAttribute();
                                        },
                                        isSelected: v == e.selectedStr);
                                  }).toList(),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                        SizedBox(height: DoScreenAdapter.h(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "购买数量",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DoScreenAdapter.fs(12)),
                            ),
                            _numSection()
                          ],
                        ),
                      ]),
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
                      child: sourceType == 0
                          ? Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        controller.addToCart();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                          DoScreenAdapter.w(8),
                                          DoScreenAdapter.h(10),
                                          DoScreenAdapter.w(0),
                                          DoScreenAdapter.h(10),
                                        ),
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  DoColors.redBegin,
                                                  DoColors.redEnd
                                                ]),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomLeft:
                                                    Radius.circular(20))),
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
                                      controller.buyNow();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                        DoScreenAdapter.w(0),
                                        DoScreenAdapter.h(10),
                                        DoScreenAdapter.w(10),
                                        DoScreenAdapter.h(10),
                                      ),
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                DoColors.yellowBegin,
                                                DoColors.yellowEnd
                                              ]),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight:
                                                  Radius.circular(20))),
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
                            )
                          : InkWell(
                              onTap: () {
                                //要判断来自哪里
                                if (sourceType == 1) {
                                  controller.addToCart();
                                } else if (sourceType == 2) {
                                  controller.buyNow();
                                } else {}
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(
                                  DoScreenAdapter.w(10),
                                  DoScreenAdapter.h(10),
                                  DoScreenAdapter.w(10),
                                  DoScreenAdapter.h(10),
                                ),
                                decoration: BoxDecoration(
                                    color: DoColors.theme,
                                    borderRadius: BorderRadius.circular(20)),
                                alignment: Alignment.center,
                                child: Text(
                                  "确定",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: DoScreenAdapter.fs(13)),
                                ),
                              ),
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
                        // color: DoColors.theme,
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

  ///数量区
  Widget _numSection() {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.cyan,
          border: Border.all(color: DoColors.gray238, width: 0.5),
          borderRadius: BorderRadius.circular(DoScreenAdapter.w(20))),
      height: DoScreenAdapter.h(22),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              controller.minusBuyNumber();
            },
            child: Container(
              alignment: Alignment.center,
              width: DoScreenAdapter.w(36),
              child: Text(
                "-",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(18),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(color: DoColors.gray238, width: 0.5),
                  right: BorderSide(color: DoColors.gray238, width: 0.5)),
            ),
            alignment: Alignment.center,
            width: DoScreenAdapter.w(42),
            child: TextField(
              style: TextStyle(
                  fontSize: DoScreenAdapter.fs(14),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) {},
              keyboardType: TextInputType.number,
              controller:
                  TextEditingController(text: "${controller.buyNumber.value}"),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          InkWell(
            onTap: () {
              controller.plusBuyNumber();
            },
            child: Container(
              alignment: Alignment.center,
              width: DoScreenAdapter.w(36),
              child: Text(
                "+",
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(18),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///Chip
  ///InputChip
  ///ChoiceChip
  ///FilterChip
  ///ActionChip
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
            color: isSelected
                ? DoColors.red251
                : const Color.fromRGBO(248, 248, 248, 1),
            borderRadius: BorderRadius.circular(DoScreenAdapter.w(5)),
            border: Border.fromBorderSide(BorderSide(
                width: DoScreenAdapter.w(0.5),
                color: isSelected
                    ? DoColors.theme
                    : const Color.fromRGBO(248, 248, 248, 1)))),
        padding: EdgeInsets.fromLTRB(DoScreenAdapter.w(10),
            DoScreenAdapter.h(5), DoScreenAdapter.w(10), DoScreenAdapter.h(5)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 12,
              color: isSelected ? DoColors.theme : Colors.black87),
        ),
      ),
    );
  }
}
