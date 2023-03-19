import 'package:doxiaomimall/app/services/app_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/goods_content_controller.dart';

class GoodsContentInfoView extends GetView {
  @override
  final GoodsContentController controller = Get.find();

  final Function()? selectedSectionEvent;
  GoodsContentInfoView(this.selectedSectionEvent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk0,
      color: Colors.white,
      width: double.infinity,
      // height: DoScreenAdapter.h(1000),
      // padding: EdgeInsets.fromLTRB(DoScreenAdapter.w(10), DoScreenAdapter.h(0),
      //     DoScreenAdapter.w(10), DoScreenAdapter.h(10)),
      // margin: EdgeInsets.fromLTRB(DoScreenAdapter.w(10), DoScreenAdapter.h(10),
      //     DoScreenAdapter.w(10), DoScreenAdapter.h(10)),
      child: Obx(
        () => controller.model.value.sId != null
            ? Column(
                children: [
                  _headerSection(),
                  _infoSection(),
                  _prebuySection(),
                  const Divider(),
                  _parametersSection(),
                  _rankingListSection(),
                  _activitySection(),
                  _activityBannerSection(),
                  Container(
                    width: double.infinity,
                    height: DoScreenAdapter.h(10),
                    color: const Color.fromARGB(31, 175, 175, 175),
                  ),
                  _stagesSection(),
                  Container(
                    width: double.infinity,
                    height: DoScreenAdapter.h(10),
                    color: const Color.fromARGB(31, 175, 175, 175),
                  ),
                  _selectedSection(),
                  Container(
                    margin: EdgeInsets.only(left: DoScreenAdapter.w(50)),
                    height: DoScreenAdapter.h(0.8),
                    color: const Color.fromARGB(31, 175, 175, 175),
                  ),
                  _postToSection(),
                  Container(
                    margin: EdgeInsets.only(left: DoScreenAdapter.w(50)),
                    height: DoScreenAdapter.h(0.8),
                    color: const Color.fromARGB(31, 175, 175, 175),
                  ),
                  _shopSection(),
                  Container(
                    margin: EdgeInsets.only(left: DoScreenAdapter.w(50)),
                    height: DoScreenAdapter.h(0.8),
                    color: const Color.fromARGB(31, 175, 175, 175),
                  ),

                  ///Divider不太明显
                  // Padding(
                  //   padding: EdgeInsets.only(left: DoScreenAdapter.w(50)),
                  //   child: const Divider(
                  //     color: Color.fromARGB(31, 175, 175, 175),
                  //   ),
                  // ),
                  _serviceSection(),
                  Container(
                    width: double.infinity,
                    height: DoScreenAdapter.h(10),
                    color: const Color.fromARGB(31, 175, 175, 175),
                  ),
                ],
              )
            : SizedBox(
                height: DoScreenAdapter.sh(),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }

  ///头部
  Widget _headerSection() {
    return Container(
      // margin: EdgeInsets.zero,
      // padding: EdgeInsets.fromLTRB(
      //     DoScreenAdapter.w(10),
      //     DoScreenAdapter.h(10),
      //     DoScreenAdapter.w(10),
      //     DoScreenAdapter.h(10)),
      color: Colors.cyan,
      width: DoScreenAdapter.sw(),
      height: DoScreenAdapter.h(280),
      child: Image.network(
        DoNetwork.replacePictureURL("${controller.model.value.pic}"),
        // "https://www.itying.com/images/b_focus01.png",
        fit: BoxFit.cover,
      ),
    );
  }

  ///基本信息
  Widget _infoSection() {
    return Padding(
      padding: EdgeInsets.fromLTRB(DoScreenAdapter.w(10), DoScreenAdapter.h(10),
          DoScreenAdapter.w(10), DoScreenAdapter.h(10)),
      child: Column(
        children: [
          Row(
            children: [
              Text("¥",
                  style: TextStyle(
                      color: DoColors.theme,
                      fontWeight: FontWeight.bold,
                      fontSize: DoScreenAdapter.fs(14))),
              Text("${controller.model.value.price}",
                  // "1599",
                  style: TextStyle(
                      color: DoColors.theme,
                      fontWeight: FontWeight.w900,
                      fontSize: DoScreenAdapter.fs(22))),
              SizedBox(
                width: DoScreenAdapter.w(10),
              ),
              Text("¥",
                  style: TextStyle(
                      fontSize: DoScreenAdapter.fs(14), color: Colors.black38)),
              Text("${controller.model.value.oldPrice}",
                  // "1999",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.black38,
                      fontSize: DoScreenAdapter.fs(14),
                      color: Colors.black38)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${controller.model.value.title}",
                  // "Redmi Note 12 Pro",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: DoScreenAdapter.fs(16))),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.file_upload_outlined,
                    size: 20,
                    color: Colors.black38,
                  ))
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("${controller.model.value.subTitle}",
                // "红米Note 12 Pro是Redmi于2022年10月27日发布的手机产品，于2022年10月31日正式上市。红米Note 12 Pro采用6.67英寸全面屏；高度约为162.9毫米，宽度约为76毫米，厚度约为7.9毫米，重量约为187克；配有子夜黑、时光蓝、镜瓷白、浅梦星河四款颜色。红米Note 12 Pro搭载联发科天玑1080八核处理器；",
                style: TextStyle(
                    color: Colors.black87, fontSize: DoScreenAdapter.fs(12))),
          ),
        ],
      ),
    );
  }

  ///机型对比&选购指南
  Widget _prebuySection() {
    return Container(
      padding: EdgeInsets.fromLTRB(DoScreenAdapter.w(10), DoScreenAdapter.h(0),
          DoScreenAdapter.w(10), DoScreenAdapter.h(0)),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(
                Icons.compare,
                size: 20,
              ),
              SizedBox(
                width: DoScreenAdapter.w(5),
              ),
              Text(
                "机型对比",
                style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
              ),
            ],
          ),
          SizedBox(
            width: DoScreenAdapter.w(20),
          ),
          Row(
            children: [
              const Icon(
                Icons.browse_gallery,
                size: 20,
              ),
              SizedBox(
                width: DoScreenAdapter.w(5),
              ),
              Text(
                "选购指南",
                style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///参数
  Widget _parametersSection() {
    return Container(
        // color: Colors.purple,
        height: DoScreenAdapter.h(80),
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          crossAxisCount: 1,
          mainAxisSpacing: DoScreenAdapter.w(5),
          crossAxisSpacing: DoScreenAdapter.h(0),
          childAspectRatio: 5 / 4,
          children: controller.paramteterList
              .map((e) => Container(
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sd_card_outlined,
                          size: DoScreenAdapter.w(18),
                        ),
                        SizedBox(
                          height: DoScreenAdapter.h(5),
                        ),
                        Text(
                          "${e["title"]}",
                          style: TextStyle(fontSize: DoScreenAdapter.w(12)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: DoScreenAdapter.h(3),
                        ),
                        Text(
                          "${e["sub_title"]}",
                          style: TextStyle(fontSize: DoScreenAdapter.w(10)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ));
  }

  ///排行榜
  Widget _rankingListSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
      height: DoScreenAdapter.h(40),
      color: DoColors.red251.withOpacity(0.2),
      child: Row(
        children: [
          const Icon(
            Icons.local_florist_sharp,
            color: DoColors.theme,
            size: 20,
          ),
          SizedBox(
            width: DoScreenAdapter.w(5),
          ),
          Text(
            "排行榜",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: DoScreenAdapter.fs(14)),
          ),
          SizedBox(
            width: DoScreenAdapter.w(10),
          ),
          Row(
            children: [
              Text("入选【学生甄选手机热销榜】",
                  style: TextStyle(fontSize: DoScreenAdapter.fs(12))),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.black38,
            size: 20,
          ),
        ],
      ),
    );
  }

  ///活动
  Widget _activitySection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
      height: DoScreenAdapter.h(40),
      child: Row(
        children: [
          const Text(
            "活动",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: DoScreenAdapter.w(20),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(2)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 0.5, color: DoColors.theme)),
                // color: DoColors.theme.withOpacity(0.2),
                child: Text(
                  "信用换新",
                  style: TextStyle(
                      color: DoColors.theme, fontSize: DoScreenAdapter.fs(10)),
                ),
              ),
              SizedBox(
                width: DoScreenAdapter.w(5),
              ),
              Text(
                "信用换新至低0元购新机",
                style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.black38,
            size: 20,
          ),
        ],
      ),
    );
  }

  ///活动banner
  Widget _activityBannerSection() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
      padding: EdgeInsets.fromLTRB(
        DoScreenAdapter.w(10),
        DoScreenAdapter.w(0),
        DoScreenAdapter.w(10),
        DoScreenAdapter.w(10),
      ),
      child: Image.asset("assets/images/change_new.png"),
    );
  }

  ///分期
  Widget _stagesSection() {
    return InkWell(
      onTap: _showStagesBottomSheet,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
        height: DoScreenAdapter.h(46),
        child: Row(
          children: [
            const Text(
              "分期",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              width: DoScreenAdapter.w(20),
            ),
            Row(
              children: [
                Text(
                  "低至69.3元x24期",
                  style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.black38,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  ///已选
  Widget _selectedSection() {
    return InkWell(
      // onTap: _showSelectedBottomSheet,
      onTap: () {
        selectedSectionEvent!();
      },
      child: Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
        height: DoScreenAdapter.h(56),
        child: Row(
          children: [
            const Text(
              "已选",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              width: DoScreenAdapter.w(20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      controller.selectedGoodsAttributes.value,
                      // "Redmi Note 12 Pro 6GB+128GB 子夜黑x1",
                      style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                    ),
                  ],
                ),
                SizedBox(
                  height: DoScreenAdapter.h(5),
                ),
                Row(
                  children: [
                    Text(
                      "可选增值服务",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: DoColors.theme),
                    ),
                  ],
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.black38,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  ///送至
  Widget _postToSection() {
    return InkWell(
      onTap: _showPostBottomSheet,
      child: Container(
        // color: Colors.cyan,
        padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
        height: DoScreenAdapter.h(56),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "送至",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              width: DoScreenAdapter.w(20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                    ),
                    Text(
                      "上海市 闵行区",
                      style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                    ),
                    SizedBox(
                      width: DoScreenAdapter.w(10),
                    ),
                    Text(
                      "有现货",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: DoColors.theme),
                    ),
                  ],
                ),
                SizedBox(
                  height: DoScreenAdapter.h(5),
                ),
                Row(
                  children: [
                    Text(
                      "今天23点前付款，预计3月17日送达",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black38),
                    ),
                    SizedBox(
                      width: DoScreenAdapter.w(5),
                    ),
                    const Icon(Icons.help_outline_outlined,
                        size: 18, color: Colors.black38),
                  ],
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.black38,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  ///门店
  Widget _shopSection() {
    return InkWell(
      onTap: _showShopBottomSheet,
      child: Container(
        // color: DoColors.theme,
        padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
        height: DoScreenAdapter.h(60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "门店",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              width: DoScreenAdapter.w(20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("小米之家浙江杭州xxxx店",
                    style: TextStyle(
                        // color: DoColors.theme,
                        fontSize: DoScreenAdapter.fs(12))),
                SizedBox(
                  height: DoScreenAdapter.h(5),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: DoColors.theme,
                          borderRadius:
                              BorderRadius.circular(DoScreenAdapter.w(2))),
                      padding:
                          // EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(2)),
                          EdgeInsets.all(DoScreenAdapter.w(2)),
                      child: Text(
                        "到店自取",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: DoScreenAdapter.fs(10)),
                      ),
                    ),
                    SizedBox(
                      width: DoScreenAdapter.w(5),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: DoColors.theme,
                          borderRadius:
                              BorderRadius.circular(DoScreenAdapter.w(2))),
                      padding:
                          // EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(2)),
                          EdgeInsets.all(DoScreenAdapter.w(2)),
                      child: Text(
                        "门店闪送",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: DoScreenAdapter.fs(10)),
                      ),
                    ),
                    SizedBox(
                      width: DoScreenAdapter.w(5),
                    ),
                    Text("距离1.5km",
                        style: TextStyle(
                            color: DoColors.theme,
                            fontSize: DoScreenAdapter.fs(12))),
                  ],
                ),
                SizedBox(
                  height: DoScreenAdapter.h(5),
                ),
                Text("10:00-22:00",
                    style: TextStyle(
                        // color: DoColors.theme,
                        fontSize: DoScreenAdapter.fs(12))),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Text(
              "库存紧张",
              style: TextStyle(
                  fontSize: DoScreenAdapter.fs(12), color: DoColors.theme),
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.black38,
              size: 20,
            ),
            // Divider(),
          ],
        ),
      ),
    );
  }

  ///服务
  Widget _serviceSection() {
    return InkWell(
      onTap: _showServiceBottomSheet,
      child: Container(
        // color: DoColors.theme,
        padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
        height: DoScreenAdapter.h(46),
        child: Row(
          children: [
            const Text(
              "服务",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              width: DoScreenAdapter.w(20),
            ),
            Expanded(
              child: Image.asset(
                "assets/images/xiaomiMenu.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.black38,
              size: 20,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  ///----封装区域----
  ///分期点击弹框
  void _showStagesBottomSheet() {
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
                    top: DoScreenAdapter.h(80),
                    bottom: (DoScreenAdapter.h(49) + DoScreenAdapter.h(34)),
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(
                        DoScreenAdapter.w(10),
                        DoScreenAdapter.h(10),
                        DoScreenAdapter.w(10),
                        DoScreenAdapter.h(10),
                      ),
                      children: [
                        ListTile(
                          onTap: () {
                            print("118.91元x3期");
                          },
                          title: Text(
                            "118.91元x3期",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                          ),
                          subtitle: Text(
                            "手续费2.58元/期起，费率2.22%，单利年化率约为13.32%，还款本金立减30元",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(10)),
                          ),
                          selected: true,
                          selectedColor: DoColors.theme,
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                          // contentPadding: EdgeInsets.all(0),
                        ),
                        ListTile(
                          onTap: () {
                            print("60.44元x6期");
                          },
                          title: Text(
                            "60.44元x6期",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                          ),
                          subtitle: Text(
                            "手续费2.27元/期起，费率3.9%，单利年化率约为13.37%，还款本金立减30元",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(10)),
                          ),
                          // trailing: Icon(Icons.arrow_forward_ios_outlined),
                        ),
                        ListTile(
                          title: Text(
                            "31.17元x12期",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                          ),
                          subtitle: Text(
                            "手续费2.09元/期起，费率7.2%，单利年化率约为13.29%，还款本金立减30元",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(10)),
                          ),
                          // trailing: Icon(Icons.arrow_forward_ios_outlined),
                        ),
                        ListTile(
                          title: Text(
                            "17.16元x24期",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                          ),
                          subtitle: Text(
                            "手续费2.62元/期起，费率18%，单利年化率约为17.28%，还款本金立减30元",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(10)),
                          ),
                          // trailing: Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ],
                    )),

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
                      child: InkWell(
                        onTap: () {
                          Get.back();
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
                            "立即购买",
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

  ///送至点击弹框
  void _showPostBottomSheet() {
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "收货地址",
                          style: TextStyle(fontSize: DoScreenAdapter.fs(16)),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: DoScreenAdapter.h(40),
                    bottom: (DoScreenAdapter.h(49) + DoScreenAdapter.h(34)),
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(
                        DoScreenAdapter.w(10),
                        DoScreenAdapter.h(0),
                        DoScreenAdapter.w(10),
                        DoScreenAdapter.h(10),
                      ),
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: const Icon(
                            Icons.location_on_outlined,
                            size: 15,
                          ),
                          title: Text(
                            "郝先森 上海",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(14)),
                          ),
                          subtitle: Text(
                            "上海市 浦东新区 xxxx街道 xxx弄 xxxx小区xxx号1203(201100)",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                          ),
                          // selected: true,
                          selectedColor: DoColors.theme,
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ],
                    )),

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
                      child: InkWell(
                        onTap: () {
                          Get.back();
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
                            "选择新地址",
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

  ///门店点击弹框
  void _showShopBottomSheet() {
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "选择门店",
                          style: TextStyle(fontSize: DoScreenAdapter.fs(16)),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: DoScreenAdapter.h(40),
                    bottom: (DoScreenAdapter.h(49) + DoScreenAdapter.h(34)),
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(
                        DoScreenAdapter.w(10),
                        DoScreenAdapter.h(0),
                        DoScreenAdapter.w(10),
                        DoScreenAdapter.h(10),
                      ),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(242, 242, 242, 1),
                            borderRadius:
                                BorderRadius.circular(DoScreenAdapter.w(10)),
                            border: const Border.fromBorderSide(
                                BorderSide(width: 0.5, color: DoColors.theme)),
                          ),
                          // margin: const EdgeInsets.all(10),
                          padding: EdgeInsets.fromLTRB(
                              DoScreenAdapter.w(0),
                              DoScreenAdapter.h(0),
                              DoScreenAdapter.w(0),
                              DoScreenAdapter.h(0)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(249, 249, 249, 1),
                                    borderRadius: BorderRadius.circular(
                                        DoScreenAdapter.w(10)),
                                  ),
                                  padding: EdgeInsets.fromLTRB(
                                      DoScreenAdapter.w(10),
                                      DoScreenAdapter.h(5),
                                      DoScreenAdapter.w(10),
                                      DoScreenAdapter.h(5)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: DoScreenAdapter.h(5),
                                      ),
                                      Text(
                                        "小米之家浙江杭州余杭区西溪印象城店",
                                        style: TextStyle(
                                            fontSize: DoScreenAdapter.fs(14),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: DoScreenAdapter.h(5),
                                      ),
                                      Text(
                                        "小米之家浙江杭州余杭区西溪印象城店上海市 浦东新区 xxxx街道 xxx弄 xxxx小区xxx号1203(201100)",
                                        style: TextStyle(
                                            fontSize: DoScreenAdapter.fs(12)),
                                      ),
                                      SizedBox(
                                        height: DoScreenAdapter.h(5),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: DoColors.theme,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        DoScreenAdapter.w(2))),
                                            padding:
                                                // EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(2)),
                                                EdgeInsets.all(
                                                    DoScreenAdapter.w(2)),
                                            child: Text(
                                              "到店自取",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      DoScreenAdapter.fs(10)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: DoScreenAdapter.w(5),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: DoColors.theme,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        DoScreenAdapter.w(2))),
                                            padding:
                                                // EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(2)),
                                                EdgeInsets.all(
                                                    DoScreenAdapter.w(2)),
                                            child: Text(
                                              "门店闪送",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      DoScreenAdapter.fs(10)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: DoScreenAdapter.w(5),
                                          ),
                                          Text("距离1.5km",
                                              style: TextStyle(
                                                  color: DoColors.theme,
                                                  fontSize:
                                                      DoScreenAdapter.fs(12))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: DoScreenAdapter.h(5),
                                      ),
                                      Text("10:00-22:00",
                                          style: TextStyle(
                                              // color: DoColors.theme,
                                              fontSize:
                                                  DoScreenAdapter.fs(12))),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  // color: Colors.black12,
                                  child: Column(
                                    children: [
                                      Text(
                                        "暂时缺货",
                                        style: TextStyle(
                                            fontSize: DoScreenAdapter.fs(12),
                                            color: Colors.black45),
                                      ),
                                      SizedBox(
                                        height: DoScreenAdapter.h(10),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.phone,
                                              size: 20,
                                              color: Colors.green,
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.green,
                                            child: Icon(
                                              Icons.wechat,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),

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
                      child: InkWell(
                        onTap: () {
                          Get.back();
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
                            "选择",
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

  ///服务点击弹框
  void _showServiceBottomSheet() {
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "服务说明",
                          style: TextStyle(fontSize: DoScreenAdapter.fs(16)),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: DoScreenAdapter.h(40),
                    bottom: (DoScreenAdapter.h(49) + DoScreenAdapter.h(34)),
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(
                        DoScreenAdapter.w(10),
                        DoScreenAdapter.h(0),
                        DoScreenAdapter.w(10),
                        DoScreenAdapter.h(10),
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            "运费说明",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                          ),
                          subtitle: Text(
                            "1)所有会员针对国内大陆地区用户购买当当自营商品,选择普通配送、平邮送货方式,单笔订单实付金额(减去促销优惠和礼券/优惠码)小于49元,则承担6元运费,满49元则免运费",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(10)),
                          ),
                        )
                      ],
                    )),

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
                      child: InkWell(
                        onTap: () {
                          Get.back();
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
                            "知道了",
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

  // ///抽取了一个选择字段组件
  // Widget _commonSelectWidget({
  //   required String title,
  //   // required bool isSelected,//需要设置false的多，所以如下了
  //   bool isSelected = false,
  //   // Function()? tapFunc
  // }) {
  //   return GestureDetector(
  //     onTap: () {
  //       if (!isSelected) {
  //         // _showDeleteSearchAlertDialog(title);
  //       }
  //       // controller.searchWords = title;
  //       // DoSearchService.saveSearchHistory(title);
  //       // Get.offAndToNamed("/goods-list", arguments: {"searchWords": title});
  //     },
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: const Color.fromRGBO(248, 248, 248, 1),
  //           borderRadius: BorderRadius.circular(DoScreenAdapter.w(5)),
  //           border: Border.fromBorderSide(BorderSide(
  //               width: DoScreenAdapter.w(0.5),
  //               color: isSelected
  //                   ? DoColors.theme
  //                   : const Color.fromRGBO(248, 248, 248, 1)))),
  //       padding: EdgeInsets.fromLTRB(DoScreenAdapter.w(10),
  //           DoScreenAdapter.h(5), DoScreenAdapter.w(10), DoScreenAdapter.h(5)),
  //       child: Text(
  //         title,
  //         style: TextStyle(
  //             fontSize: 12, color: isSelected ? DoColors.theme : Colors.black87),
  //       ),
  //     ),
  //   );
  // }

  // ///已选点击弹框
  // void _showSelectedBottomSheet() {
  //   Get.bottomSheet(
  //     Container(
  //       width: DoScreenAdapter.sw(),
  //       height: DoScreenAdapter.h(500),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(DoScreenAdapter.w(10)),
  //           topRight: Radius.circular(DoScreenAdapter.w(10)),
  //         ),
  //       ),
  //       child: Stack(
  //         children: [
  //           Positioned(
  //             left: 0,
  //             right: 0,
  //             top: 0,
  //             child: Container(
  //               padding: EdgeInsets.all(DoScreenAdapter.w(10)),
  //               decoration: const BoxDecoration(
  //                   border: Border(
  //                       bottom: BorderSide(width: 0.5, color: Colors.black12))),
  //               child: Row(
  //                 children: [
  //                   SizedBox(
  //                       width: DoScreenAdapter.w(80),
  //                       height: DoScreenAdapter.w(80),
  //                       child: Image.network(
  //                         "https://www.itying.com/images/b_focus01.png",
  //                         fit: BoxFit.cover,
  //                       )),
  //                   SizedBox(width: DoScreenAdapter.w(10)),
  //                   Column(
  //                     // mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text("¥1599",
  //                           style: TextStyle(
  //                               color: DoColors.theme,
  //                               fontWeight: FontWeight.w900,
  //                               fontSize: DoScreenAdapter.fs(16))),
  //                       SizedBox(height: DoScreenAdapter.h(10)),
  //                       Text("Redmi Note 12 Pro",
  //                           maxLines: 2,
  //                           style: TextStyle(fontSize: DoScreenAdapter.fs(12))),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Positioned(
  //             left: 0,
  //             right: 0,
  //             top: DoScreenAdapter.h(80),
  //             bottom: (DoScreenAdapter.h(49) + DoScreenAdapter.h(34)),
  //             child: ListView(
  //               padding: EdgeInsets.fromLTRB(
  //                 DoScreenAdapter.w(10),
  //                 DoScreenAdapter.h(10),
  //                 DoScreenAdapter.w(10),
  //                 DoScreenAdapter.h(10),
  //               ),
  //               children: [
  //                 SizedBox(height: DoScreenAdapter.h(10)),
  //                 Text(
  //                   "版本",
  //                   style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: DoScreenAdapter.fs(12)),
  //                 ),
  //                 SizedBox(height: DoScreenAdapter.h(10)),
  //                 Wrap(
  //                   spacing: DoScreenAdapter.h(10),
  //                   runSpacing: DoScreenAdapter.w(10),
  //                   children: [
  //                     ///Chip
  //                     ///InputChip
  //                     ///ChoiceChip
  //                     ///FilterChip
  //                     ///ActionChip
  //                     // Container(
  //                     //   // padding: EdgeInsets.all(5),
  //                     //   // margin: EdgeInsets.all(5),
  //                     //   child: Chip(
  //                     //     // avatar: const Icon(
  //                     //     //   Icons.av_timer,
  //                     //     //   size: 20,
  //                     //     // ),
  //                     //     side: const BorderSide(color: DoColors.theme, width: 0.5),
  //                     //     shape: RoundedRectangleBorder(
  //                     //         borderRadius: BorderRadius.circular(5)),
  //                     //     backgroundColor:
  //                     //         const Color.fromRGBO(248, 248, 248, 1),
  //                     //     labelPadding: const EdgeInsets.all(0),
  //                     //     // padding: const EdgeInsets.symmetric(horizontal: 2),
  //                     //     // visualDensity: const VisualDensity(vertical: 0), //不生效
  //                     //     padding: EdgeInsets.all(0),
  //                     //     label: Text("测试chip",
  //                     //         style:
  //                     //             TextStyle(fontSize: DoScreenAdapter.fs(12))),
  //                     //     // onDeleted: () {},
  //                     //     // deleteIcon: const Icon(
  //                     //     //   Icons.delete,
  //                     //     //   size: 15,
  //                     //     // ),
  //                     //   ),
  //                     // ),
  //                     _commonSelectWidget(title: "6GB+128GB", isSelected: true),
  //                     _commonSelectWidget(title: "8GB+128GB"),
  //                   ],
  //                 ),
  //                 SizedBox(height: DoScreenAdapter.h(10)),
  //                 Text(
  //                   "颜色",
  //                   style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: DoScreenAdapter.fs(12)),
  //                 ),
  //                 SizedBox(height: DoScreenAdapter.h(10)),
  //                 Wrap(
  //                   spacing: DoScreenAdapter.h(10),
  //                   runSpacing: DoScreenAdapter.w(10),
  //                   children: [
  //                     _commonSelectWidget(title: "清凉薄荷", isSelected: true),
  //                     _commonSelectWidget(title: "冰峰黑提"),
  //                     _commonSelectWidget(title: "晴光白雪"),
  //                     _commonSelectWidget(title: "樱花蜜粉"),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Positioned(
  //             left: 0,
  //             right: 0,
  //             bottom: 0,
  //             // height: DoScreenAdapter.h(80),
  //             child: Container(
  //               // color: Colors.purple,
  //               height: (DoScreenAdapter.h(49) + DoScreenAdapter.h(34)),
  //               child: Container(
  //                 //内层实际显示小的
  //                 height: DoScreenAdapter.h(49),
  //                 margin: EdgeInsets.fromLTRB(
  //                   DoScreenAdapter.w(0),
  //                   DoScreenAdapter.h(0),
  //                   DoScreenAdapter.w(0),
  //                   DoScreenAdapter.h(34) + DoScreenAdapter.h(0),
  //                 ),
  //                 decoration: BoxDecoration(
  //                     // color: Colors.white,
  //                     border: Border(
  //                   //顶部边线
  //                   top: BorderSide(
  //                     width: DoScreenAdapter.h(0.5),
  //                     color: Colors.black12,
  //                   ),
  //                 )),
  //                 child: Row(
  //                   children: [
  //                     Expanded(
  //                         flex: 1,
  //                         child: InkWell(
  //                           onTap: () {
  //                             Get.back();
  //                           },
  //                           child: Container(
  //                             margin: EdgeInsets.fromLTRB(
  //                               DoScreenAdapter.w(8),
  //                               DoScreenAdapter.h(10),
  //                               DoScreenAdapter.w(0),
  //                               DoScreenAdapter.h(10),
  //                             ),
  //                             decoration: const BoxDecoration(
  //                                 color: DoColors.theme,
  //                                 borderRadius: BorderRadius.only(
  //                                     topLeft: Radius.circular(20),
  //                                     bottomLeft: Radius.circular(20))),
  //                             alignment: Alignment.center,
  //                             child: Text(
  //                               "加入购物车",
  //                               style: TextStyle(
  //                                   color: Colors.white,
  //                                   fontSize: DoScreenAdapter.fs(13)),
  //                             ),
  //                           ),
  //                         )),
  //                     Expanded(
  //                       flex: 1,
  //                       child: InkWell(
  //                         onTap: () {
  //                           Get.back();
  //                         },
  //                         child: Container(
  //                           margin: EdgeInsets.fromLTRB(
  //                             DoScreenAdapter.w(0),
  //                             DoScreenAdapter.h(10),
  //                             DoScreenAdapter.w(10),
  //                             DoScreenAdapter.h(10),
  //                           ),
  //                           decoration: const BoxDecoration(
  //                               color: DoColors.theme,
  //                               borderRadius: BorderRadius.only(
  //                                   topRight: Radius.circular(20),
  //                                   bottomRight: Radius.circular(20))),
  //                           alignment: Alignment.center,
  //                           child: Text(
  //                             "立即购买",
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontSize: DoScreenAdapter.fs(13)),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           //这个关闭按钮要最后添加,若是先加，可能被其他Positioned的组件遮盖，点击事件无法响应
  //           Positioned(
  //               right: DoScreenAdapter.w(5),
  //               top: DoScreenAdapter.h(5),
  //               child: InkWell(
  //                 onTap: () {
  //                   print("Get.back()");
  //                   Get.back();
  //                 },
  //                 child: const SizedBox(
  //                   // alignment: Alignment.center,
  //                   // color: DoColors.theme,
  //                   child: Icon(
  //                     Icons.close,
  //                     size: 20,
  //                   ),
  //                 ),
  //               )),
  //         ],
  //       ),
  //     ),
  //     isScrollControlled: true, //设置完这个，上面设置的超过半屏的高度才会生效，否则默认最高半屏
  //   );
  // }
}
