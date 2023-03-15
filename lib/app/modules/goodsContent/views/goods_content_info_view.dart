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
            color: Colors.black12,
          ),
          _stagesSection(),
          Container(
            width: double.infinity,
            height: DoScreenAdapter.h(10),
            color: Colors.black12,
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
              Text("¥"),
              Text("1599"),
              SizedBox(
                width: DoScreenAdapter.w(10),
              ),
              Text("¥"),
              Text("1599"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Redmi Note 12 Pro"),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.file_upload_outlined))
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("xxxxxxxxxxxxxxxxxxxxxxxxxxx",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DoScreenAdapter.fs(12))),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                "1. 商品商品商品商品商品商品商品商品商品商品商品商品商品商品\n2. 第二行第二行第二行第二行第二行第二行第二行第二行第二行第二行第二行第二行第二行第二行\n3. 第三行第三行第三行第三行第三行第三行第三行第三行第三行第三行第三行第三行第三行第三行"),
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
          const Icon(Icons.keyboard_arrow_right_outlined),
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
                style: TextStyle(fontSize: DoScreenAdapter.fs(10)),
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const Icon(Icons.keyboard_arrow_right_outlined),
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
      height: DoScreenAdapter.h(40),
      child: Row(
        children: [
          const Text(
            "分期",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: DoScreenAdapter.w(20),
          ),
          Row(
            children: [
              Text("低至69.3元x24期"),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }

  ///已选
  Widget _selectedSection() {
    return Container(
      // alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
      height: DoScreenAdapter.h(60),
      child: Row(
        children: [
          const Text(
            "已选",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: DoScreenAdapter.w(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Redmi Note 12 Pro 6GB+128GB 子夜黑x1"),
                ],
              ),
              Row(
                children: [
                  Text("可选增值服务"),
                ],
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }

  ///送至
  Widget _postToSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
      height: DoScreenAdapter.h(60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "送至",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: DoScreenAdapter.w(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text("上海市 闵行区"),
                  Text("有现货"),
                ],
              ),
              Row(
                children: [
                  Text("今天23点前付款，预计3月17日送达"),
                  Icon(Icons.help_outline_outlined),
                ],
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }

  ///门店
  Widget _shopSection() {
    return Container(
      color: Colors.cyan,
      padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
      height: DoScreenAdapter.h(80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "门店",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: DoScreenAdapter.w(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("小米之家浙江杭州xxxx店",
                  style: TextStyle(
                      // color: Colors.orange,
                      fontSize: DoScreenAdapter.fs(12))),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius:
                            BorderRadius.circular(DoScreenAdapter.w(2))),
                    padding:
                        EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(2)),
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
                        EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(2)),
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
                          fontSize: DoScreenAdapter.fs(10))),
                ],
              ),
              Text("10:00-22:00",
                  style: TextStyle(
                      // color: Colors.orange,
                      fontSize: DoScreenAdapter.fs(12))),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Text("库存紧张"),
          Icon(Icons.keyboard_arrow_right_outlined),
          Divider(),
        ],
      ),
    );
  }

  ///服务
  Widget _serviceSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
      height: DoScreenAdapter.h(40),
      child: Row(
        children: [
          const Text(
            "服务",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: DoScreenAdapter.w(20),
          ),
          Expanded(
            child: Image.asset("assets/images/xiaomiMenu.png"),
          ),
          const Icon(Icons.keyboard_arrow_right_outlined),
          const Divider(),
        ],
      ),
    );
  }
}
