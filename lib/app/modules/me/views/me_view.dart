import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../components/app_components.dart';
import '../../../services/app_colors.dart';
import '../../../services/app_fontIcons.dart';
import '../../../services/app_network.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/me_controller.dart';

class MeView extends GetView<MeController> {
  ///几个登录页面都需要用到，共享的，所以各页面的销毁会导致各页面find的也销毁，所以懒加载的不行
  // @override
  // final MeController controller = Get.put(MeController());
  const MeView({Key? key}) : super(key: key);
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
      // leading: Row(
      //   children: [
      //     const Icon(
      //       Icons.child_care_sharp,
      //       color: Colors.black87,
      //       size: 20,
      //     ),
      //     Text(
      //       "用户昵称",
      //       style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
      //     ),
      //   ],
      // ),
      leadingWidth: DoScreenAdapter.w(100),
      actions: [
        InkWell(
          onTap: () {
            Get.toNamed("/vip-code");
            // controller.logout();
          },
          child: Container(
            padding: EdgeInsets.only(right: DoScreenAdapter.w(10)),
            child: Row(
              children: [
                Text(
                  "会员码",
                  style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                ),
                SizedBox(
                  width: DoScreenAdapter.w(5),
                ),
                const Icon(
                  Icons.qr_code,
                  color: Colors.black87,
                  size: 20,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed("/setting");
          },
          child: Container(
              padding: EdgeInsets.only(
                  right: DoScreenAdapter.w(10), left: DoScreenAdapter.w(5)),
              child: const Icon(
                Icons.settings,
                color: Colors.black87,
                size: 20,
              )),
        ),
        InkWell(
          onTap: () {
            Get.toNamed("/message-notification");
          },
          child: Container(
              padding: EdgeInsets.only(
                  right: DoScreenAdapter.w(10), left: DoScreenAdapter.w(5)),
              child: const Icon(
                DoFontIcons.message,
                color: Colors.black87,
                size: 20,
              )),
        ),
      ],
    );
  }

  ///body部分
  Widget _body() {
    return SmartRefresher(
      enablePullDown: true,
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      header: const WaterDropMaterialHeader(
        color: Colors.white,
        backgroundColor: DoColors.theme,
      ),
      child: ListView(
        padding: EdgeInsets.all(DoScreenAdapter.w(10)),
        children: [
          _profileHeaderSection(),
          _profileMenuSection(),
          _mallVIPSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          _orderRecordSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          _serviceSection(),
          SizedBox(height: DoScreenAdapter.h(10)),
          _bannerSection(),
          _goodsListView(),
        ],
      ),
    );
  }

  ///个人信息头部
  Widget _profileHeaderSection() {
    return Obx(() => controller.isLogin.value
        ? SizedBox(
            height: DoScreenAdapter.h(40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed("/personal-homepage");
                  },
                  child: CircleAvatar(
                    radius: DoScreenAdapter.w(25),
                    backgroundImage:
                        const AssetImage("assets/images/avatar_man.png"),
                  ),
                ),
                SizedBox(
                  width: DoScreenAdapter.w(10),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "17623458080",
                      "${controller.model.value.username}",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: DoScreenAdapter.h(5)),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(DoScreenAdapter.w(3)),
                          decoration: BoxDecoration(
                              color: DoColors.gray238,
                              borderRadius:
                                  BorderRadius.circular(DoScreenAdapter.w(10))),
                          child: Text(
                            "小米ID${controller.model.value.sId}",
                            style: TextStyle(fontSize: DoScreenAdapter.fs(10)),
                          ),
                        ),
                        SizedBox(width: DoScreenAdapter.w(10)),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/vip-medal");
                          },
                          child: Container(
                              padding: EdgeInsets.all(DoScreenAdapter.w(3)),
                              decoration: BoxDecoration(
                                  color: DoColors.gray238,
                                  borderRadius: BorderRadius.circular(
                                      DoScreenAdapter.w(10))),
                              child: Row(
                                children: [
                                  Text(
                                    "勋章0枚",
                                    style: TextStyle(
                                        fontSize: DoScreenAdapter.fs(10)),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 10,
                                    color: Colors.black26,
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        : SizedBox(
            height: DoScreenAdapter.h(40),
            child: InkWell(
              onTap: () {
                ///一键登录页面，UI有了
                // Get.toNamed("/one-click-login");
                ///验证码登录
                Get.toNamed("/verification-code-login");
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: DoScreenAdapter.w(25),
                    backgroundImage:
                        const AssetImage("assets/images/avatar_default.png"),
                  ),
                  SizedBox(
                    width: DoScreenAdapter.w(10),
                  ),
                  const Text(
                    "登录/注册",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 10,
                    color: Colors.black26,
                  )
                ],
              ),
            ),
          ));
  }

  ///个人菜单相关
  Widget _profileMenuSection() {
    return Obx(
      () => Container(
        // color: DoColors.theme,
        height: DoScreenAdapter.h(40),
        margin: EdgeInsets.symmetric(vertical: DoScreenAdapter.h(10)),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      controller.isLogin.value
                          ? "${controller.model.value.gold}"
                          : "-",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "米金",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black45),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      controller.isLogin.value
                          ? "${controller.model.value.coupon}"
                          : "-",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "优惠券",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black45),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      controller.isLogin.value
                          ? "${controller.model.value.redPacket}"
                          : "-",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "红包",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black45),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      controller.isLogin.value
                          ? "${controller.model.value.quota}万元"
                          : "-",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "最高额度",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black45),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.account_balance_wallet_outlined),
                    Text(
                      "钱包",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(12),
                          color: Colors.black45),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  ///商城会员相关
  Widget _mallVIPSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DoScreenAdapter.h(10)),
        color: Colors.green,
        image: const DecorationImage(
          image: AssetImage("assets/images/user_ad1.png"),
          fit: BoxFit.fill,
        ),
      ),
      height: DoScreenAdapter.h(90),
    );
  }

  ///订单及操作记录相关
  Widget _orderRecordSection() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
        // height: DoScreenAdapter.h(90),
        child: Column(
          children: [
            SizedBox(
              height: DoScreenAdapter.h(30),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: DoScreenAdapter.h(30),
                      alignment: Alignment.center,
                      child: Text(
                        // "收藏",
                        controller.isLogin.value
                            ? "收藏 ${controller.model.value.collect}"
                            : "收藏",
                        style: TextStyle(
                            fontSize: DoScreenAdapter.fs(12),
                            color: Colors.black45),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  width: DoScreenAdapter.w(0.5),
                                  color: Colors.black12),
                              right: BorderSide(
                                  width: DoScreenAdapter.w(0.5),
                                  color: Colors.black12))),
                      height: DoScreenAdapter.h(30),
                      alignment: Alignment.center,
                      child: Text(
                        // "足迹",
                        controller.isLogin.value
                            ? "足迹 ${controller.model.value.footmark}"
                            : "足迹",
                        style: TextStyle(
                            fontSize: DoScreenAdapter.fs(12),
                            color: Colors.black45),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: DoScreenAdapter.h(30),
                      alignment: Alignment.center,
                      child: Text(
                        // "关注",
                        controller.isLogin.value
                            ? "关注 ${controller.model.value.follow}"
                            : "关注",
                        style: TextStyle(
                            fontSize: DoScreenAdapter.fs(12),
                            color: Colors.black45),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(height: DoScreenAdapter.h(1), color: Colors.black12),
            Container(
              height: DoScreenAdapter.h(50),
              margin: EdgeInsets.symmetric(vertical: DoScreenAdapter.w(5)),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/order-list");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.payment_outlined),
                            Text(
                              "待付款",
                              style: TextStyle(
                                  fontSize: DoScreenAdapter.fs(12),
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/order-list");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.delivery_dining_outlined),
                            Text(
                              "待收货",
                              style: TextStyle(
                                  fontSize: DoScreenAdapter.fs(12),
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/order-list");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.comment_outlined),
                            Text(
                              "待评价",
                              style: TextStyle(
                                  fontSize: DoScreenAdapter.fs(12),
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/order-list");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.change_circle_outlined),
                            Text(
                              "退换/售后",
                              style: TextStyle(
                                  fontSize: DoScreenAdapter.fs(12),
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/order-list");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.list_alt_outlined),
                            Text(
                              "全部订单",
                              style: TextStyle(
                                  fontSize: DoScreenAdapter.fs(12),
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///服务
  Widget _serviceSection() {
    return Container(
      // padding: EdgeInsets.all(DoScreenAdapter.w(10)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
      child: Column(
        children: [
          Container(
            // color: Colors.purple,
            padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
            child: _serviceHeader(),
          ),
          Container(
              // color: Colors.cyan,
              height: DoScreenAdapter.h(140),
              child: GridView.builder(
                // padding: EdgeInsets.all(DoScreenAdapter.w(10)),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                      EasyLoading.showToast(
                          controller.serviceList[index]["title"]);

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
              )),
        ],
      ),
    );
  }

  ///服务-头
  Widget _serviceHeader() {
    return commonHeader(
        title: "服务",
        onTap: () {
          EasyLoading.showToast("全部服务页面");
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

  ///banner区域
  Widget _bannerSection() {
    return Container(
      height: DoScreenAdapter.h(120),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DoScreenAdapter.w(10)),
        // color: Colors.cyan,
        // color: const Color.fromRGBO(246, 246, 246, 1),
      ),
      child: Obx(
        () => Swiper(
          autoplay: true,
          loop: true,
          itemCount: controller.bannerList.length,
          pagination: SwiperPagination(
              margin: const EdgeInsets.all(0.0),
              builder: SwiperCustomPagination(
                  builder: (BuildContext context, SwiperPluginConfig config) {
                return ConstrainedBox(
                  constraints: BoxConstraints.expand(
                      height: DoScreenAdapter.h(15)), //隔底部的间距
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: const RectSwiperPaginationBuilder(
                            color: Colors.black12,
                            activeColor: Colors.white,
                          ).build(context, config),
                        ),
                      )
                    ],
                  ),
                );
              })),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DoScreenAdapter.w(10)),
                image: DecorationImage(
                    image: NetworkImage(DoNetwork.replacePictureURL(
                        controller.bannerList[index].pic!)),
                    fit: BoxFit.fill),
                // color: const Color.fromRGBO(246, 246, 246, 1),
                // color: Colors.cyan,
              ),
              // child: Image.network(
              //   DoNetwork.replacePictureURL(controller.bannerList[index].pic!),
              //   fit: BoxFit.fill,
              // ),
            );
          },
        ),
      ),
    );
  }

  ///为你精选-瀑布流列表
  Widget _goodsListView() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(10),
              DoScreenAdapter.w(0),
              DoScreenAdapter.h(10)),
          child: const Text(
            "为你精选",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Obx(() => MasonryGridView.count(
              // padding: EdgeInsets.all(DoScreenAdapter.w(10)),
              crossAxisCount: 2,
              mainAxisSpacing: DoScreenAdapter.w(10), //垂直间距
              crossAxisSpacing: DoScreenAdapter.h(8), //水平间距
              itemCount: controller.goodsList.length,
              shrinkWrap: true, //收缩，让子元素自适应宽度
              physics:
                  const NeverScrollableScrollPhysics(), //禁止自身滚动，让外面的listView滚动
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed("/goods-content", arguments: {
                      "sid": controller.goodsList[index].sId,
                      "isCanJumpCart": true,
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(DoScreenAdapter.w(5)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          //这个是为了测试设置图片上左，上右的圆角而设置的，暂时不能完美实现，如下注释
                          // height: DoScreenAdapter.h(40),
                          padding: EdgeInsets.all(DoScreenAdapter.w(5)),
                          // decoration: BoxDecoration(
                          //如果要如下设置上左，上右的圆角，必须要有container的height，
                          //但是这样，就不能让图片自适应了，或者计算，或者网络直接返回图片的高
                          // borderRadius: BorderRadius.only(
                          //     topLeft:
                          //         Radius.circular(DoScreenAdapter.w(5)),
                          //     topRight:
                          //         Radius.circular(DoScreenAdapter.w(5))),
                          // image: DecorationImage(
                          //     image: NetworkImage(
                          //         DoNetwork.replacePictureURL(
                          //             controller.goodsList[index].pic!)),
                          //     fit: BoxFit.cover),
                          // ),
                          ///若有特殊圆角需求，可以用上面的DecorationImage，但是各条件要满足，否则直接用child自适应
                          child: Image.network(
                            DoNetwork.replacePictureURL(
                                controller.goodsList[index].pic!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              DoScreenAdapter.w(10),
                              DoScreenAdapter.h(0),
                              DoScreenAdapter.w(10),
                              DoScreenAdapter.h(5)),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${controller.goodsList[index].title}",
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(14),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: DoScreenAdapter.w(10)),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${controller.goodsList[index].subTitle}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: DoScreenAdapter.fs(12),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              DoScreenAdapter.w(10),
                              DoScreenAdapter.h(15),
                              DoScreenAdapter.w(10),
                              DoScreenAdapter.h(10)),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "¥${controller.goodsList[index].price}",
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(14),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      ],
    );
  }
}
