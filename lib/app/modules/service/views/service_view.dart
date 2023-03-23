import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_screenAdapter.dart';
import '../../../services/app_userService.dart';
import '../controllers/service_controller.dart';
import '../../../components/app_components.dart';

class ServiceView extends GetView<ServiceController> {
  const ServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: _customAppBar(),
      body: _body(),
    );
  }

  ///自定义的appBar
  AppBar _customAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor:
          const Color.fromRGBO(246, 246, 246, 1), //Colors.transparent=白色透明度为0
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              Get.toNamed("/official-service");
            },
            icon: const Icon(
              Icons.qr_code,
              color: Colors.black87,
            )),
      ],
      title: InkWell(
        onTap: () {
          Get.toNamed("/customer-service");
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: DoScreenAdapter.w(300),
          height: DoScreenAdapter.h(26),
          decoration: BoxDecoration(
            color: Colors.white,
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
                "您好，在线客服为您服务",
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

  ///body部分
  Widget _body() {
    return ListView(
      padding: EdgeInsets.all(DoScreenAdapter.w(10)),
      children: [
        _serviceSection(),
        commonHeader(title: "我的设备"),
        _myDevicesSection(),
        commonHeader(title: "服务优选"),
        _serviceBetterChooseSection(),
        _nearbyServiceHeader(),
        _nearbyServiceSection(),
        _guessQuestionHeader(),
        _guessQuestionSection(),
      ],
    );
  }

  ///服务
  Widget _serviceSection() {
    return Container(
        height: DoScreenAdapter.h(150),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(DoScreenAdapter.w(10)),
          itemCount: controller.serviceList.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: DoScreenAdapter.w(10),
              crossAxisSpacing: DoScreenAdapter.w(10),
              childAspectRatio: 1),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // print(controller.serviceList[index]["uniId"]);
                EasyLoading.showToast(controller.serviceList[index]["title"]);

                ///使用唯一的标识符，因为名称和图标有可能更换
                switch (controller.serviceList[index]["uniId"]) {
                  case "s0":
                    // print("我要安装");
                    break;
                  case "s1":
                    // print("我要维修");
                    break;
                  case "s2":
                    // print("我要退换");
                    break;
                  case "s3":
                    // print("服务进度");
                    break;
                  case "s4":
                    // print("以旧换新");
                    break;
                  case "s5":
                    // print("维修价格");
                    break;
                  case "s6":
                    // print("我要贴膜");
                    break;
                  case "s7":
                    // print("全服服务");
                    Get.toNamed("/official-service");
                    break;
                  default:
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    controller.serviceList[index]["icon"],
                    color: controller.serviceList[index]["color"],
                  ),
                  SizedBox(
                    height: DoScreenAdapter.h(10),
                  ),
                  Text(
                    controller.serviceList[index]["title"],
                    style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                  ),
                ],
              ),
            );
          },
        ));
  }

  ///我的设备
  Widget _myDevicesSection() {
    return Container(
      padding: EdgeInsets.all(DoScreenAdapter.w(10)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "自动识别手机保修期与更多米家设备？",
            style: TextStyle(fontSize: DoScreenAdapter.fs(14)),
          ),
          InkWell(
            onTap: () {
              EasyLoading.showToast("设备信息授权-后续");
            },
            child: Container(
                padding: EdgeInsets.fromLTRB(
                    DoScreenAdapter.w(15),
                    DoScreenAdapter.h(5),
                    DoScreenAdapter.w(15),
                    DoScreenAdapter.h(5)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: DoColors.theme,
                    borderRadius: BorderRadius.circular(DoScreenAdapter.w(20))),
                child: Text("立即识别",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: DoScreenAdapter.fs(12),
                    ))),
          ),
        ],
      ),
    );
  }

  ///服务优选
  Widget _serviceBetterChooseSection() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                EasyLoading.showToast("手机维修钜惠-网页");
              },
              child: Container(
                height: DoScreenAdapter.h(70),
                padding: EdgeInsets.all(DoScreenAdapter.w(10)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "手机维修钜惠",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: DoScreenAdapter.h(5),
                    ),
                    Text(
                      "主板维修139元起",
                      style: TextStyle(
                        fontSize: DoScreenAdapter.fs(10),
                      ),
                    ),
                  ],
                ),
              ),
            )),
        SizedBox(
          width: DoScreenAdapter.w(10),
        ),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                EasyLoading.showToast("手机特惠屏优惠-网页");
              },
              child: Container(
                height: DoScreenAdapter.h(70),
                padding: EdgeInsets.all(DoScreenAdapter.w(10)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "手机特惠屏优惠",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: DoScreenAdapter.h(5),
                    ),
                    Text(
                      "屏幕维修150元起",
                      style: TextStyle(
                        fontSize: DoScreenAdapter.fs(10),
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }

  ///附近服务-头
  Widget _nearbyServiceHeader() {
    return commonHeader(
        title: "附近服务",
        onTap: () {
          EasyLoading.showToast("地图页面");
        },
        trailing: Row(
          children: [
            Text(
              "查看更多",
              style: TextStyle(
                  fontSize: DoScreenAdapter.fs(12), color: Colors.black38),
            ),
            SizedBox(
              width: DoScreenAdapter.w(5),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 12,
              color: Colors.black38,
            ),
          ],
        ));
  }

  ///附近服务
  Widget _nearbyServiceSection() {
    return InkWell(
      onTap: () {
        EasyLoading.showToast("小米之家浙江杭州xxxx店-详情");
      },
      child: Container(
        height: DoScreenAdapter.h(160),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/xiaomiShop.jpeg"),
                fit: BoxFit.cover),
            color: Colors.white,
            borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            DoScreenAdapter.w(10),
            DoScreenAdapter.h(0),
            DoScreenAdapter.w(10),
            DoScreenAdapter.h(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("小米之家浙江杭州xxxx店",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: DoScreenAdapter.fs(14),
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: DoScreenAdapter.h(5),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(DoScreenAdapter.w(2)),
                        border: Border.all(width: 0.5, color: Colors.white)),
                    padding: EdgeInsets.all(DoScreenAdapter.w(2)),
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
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(DoScreenAdapter.w(2)),
                        border: Border.all(width: 0.5, color: Colors.white)),
                    padding: EdgeInsets.all(DoScreenAdapter.w(2)),
                    child: Text(
                      "到店闪送",
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
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(DoScreenAdapter.w(2)),
                        border: Border.all(width: 0.5, color: Colors.white)),
                    padding: EdgeInsets.all(DoScreenAdapter.w(2)),
                    child: Text(
                      "服务受理",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: DoScreenAdapter.fs(10)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: DoScreenAdapter.h(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("营业时间：10:00-22:00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: DoScreenAdapter.fs(12))),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Colors.white,
                      ),
                      Text("1.49km",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: DoScreenAdapter.fs(12))),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///猜你想问-头
  Widget _guessQuestionHeader() {
    return commonHeader(
        title: "猜你想问",
        onTap: () {
          EasyLoading.showToast("更换问题数据");
        },
        trailing: Row(
          children: [
            Text(
              "换一换",
              style: TextStyle(
                  fontSize: DoScreenAdapter.fs(12), color: Colors.black38),
            ),
            SizedBox(
              width: DoScreenAdapter.w(5),
            ),
            const Icon(
              Icons.change_circle,
              size: 12,
              color: Colors.black38,
            ),
          ],
        ));
  }

  ///猜你想问
  Widget _guessQuestionSection() {
    return Container(
        padding: EdgeInsets.all(DoScreenAdapter.w(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
        child: Column(
          children: controller.questionList
              .map((e) => InkWell(
                    onTap: () {
                      ///这个对应QS系统的页面，可能是webview
                      ///根据questionList列表中的uniId去请求页面即可
                      EasyLoading.showToast("小米客服帮助中心:${e["title"]}");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(DoScreenAdapter.w(5)),
                      child: Row(
                        children: [
                          Text(
                            "·",
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: DoScreenAdapter.fs(25)),
                          ),
                          SizedBox(
                            width: DoScreenAdapter.w(5),
                          ),
                          Text(
                            e["title"],
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(14),
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ));
  }
}
