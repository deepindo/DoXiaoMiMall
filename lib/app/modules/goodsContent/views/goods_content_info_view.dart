import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/goods_content_controller.dart';

class GoodsContentInfoView extends GetView {
  @override
  final GoodsContentController controller = GoodsContentController();

  GoodsContentInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk1,
      color: Colors.white,
      width: double.infinity,
      // height: DoScreenAdapter.h(1000),
      // padding: EdgeInsets.fromLTRB(DoScreenAdapter.w(10), DoScreenAdapter.h(0),
      //     DoScreenAdapter.w(10), DoScreenAdapter.h(10)),
      // margin: EdgeInsets.fromLTRB(DoScreenAdapter.w(10), DoScreenAdapter.h(10),
      //     DoScreenAdapter.w(10), DoScreenAdapter.h(10)),
      child: Column(
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
          _postToSection(),
          _shopSection(),
          _serviceSection(),
        ],
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
        "https://www.itying.com/images/b_focus01.png",
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
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: DoScreenAdapter.fs(14))),
              Text("1599",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w900,
                      fontSize: DoScreenAdapter.fs(22))),
              SizedBox(
                width: DoScreenAdapter.w(10),
              ),
              Text("¥",
                  style: TextStyle(
                      fontSize: DoScreenAdapter.fs(14), color: Colors.black38)),
              Text("1999",
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
              Text("Redmi Note 12 Pro",
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
            child: Text(
                "红米Note 12 Pro是Redmi于2022年10月27日发布的手机产品，于2022年10月31日正式上市。红米Note 12 Pro采用6.67英寸全面屏；高度约为162.9毫米，宽度约为76毫米，厚度约为7.9毫米，重量约为187克；配有子夜黑、时光蓝、镜瓷白、浅梦星河四款颜色。红米Note 12 Pro搭载联发科天玑1080八核处理器；",
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
                    // color: Colors.orange,
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
      color: Colors.orange.withOpacity(0.2),
      child: Row(
        children: [
          const Icon(
            Icons.local_florist_sharp,
            color: Colors.orange,
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
                    border: Border.all(width: 0.5, color: Colors.orange)),
                // color: Colors.orange.withOpacity(0.2),
                child: Text(
                  "信用换新",
                  style: TextStyle(
                      color: Colors.orange, fontSize: DoScreenAdapter.fs(10)),
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
    return Container(
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
    );
  }

  ///已选
  Widget _selectedSection() {
    return Container(
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
                    "Redmi Note 12 Pro 6GB+128GB 子夜黑x1",
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
                        fontSize: DoScreenAdapter.fs(12), color: Colors.orange),
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
    );
  }

  ///送至
  Widget _postToSection() {
    return Container(
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
                        fontSize: DoScreenAdapter.fs(12), color: Colors.orange),
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
    );
  }

  ///门店
  Widget _shopSection() {
    return Container(
      // color: Colors.orange,
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
                      // color: Colors.orange,
                      fontSize: DoScreenAdapter.fs(12))),
              SizedBox(
                height: DoScreenAdapter.h(5),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
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
                        color: Colors.orange,
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
                          color: Colors.orange,
                          fontSize: DoScreenAdapter.fs(12))),
                ],
              ),
              SizedBox(
                height: DoScreenAdapter.h(5),
              ),
              Text("10:00-22:00",
                  style: TextStyle(
                      // color: Colors.orange,
                      fontSize: DoScreenAdapter.fs(12))),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            "库存紧张",
            style: TextStyle(
                fontSize: DoScreenAdapter.fs(12), color: Colors.orange),
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.black38,
            size: 20,
          ),
          // Divider(),
        ],
      ),
    );
  }

  ///服务
  Widget _serviceSection() {
    return Container(
      // color: Colors.orange,
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
    );
  }
}
