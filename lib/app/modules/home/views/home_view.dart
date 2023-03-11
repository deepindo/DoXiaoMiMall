import 'package:doxiaomimall/app/services/app_screenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../services/app_fontIcons.dart';
import '../../../services/app_keepAliveWrapper.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
          body: Stack(
        children: [
          _contentListView(),
          _customAppBar(),
        ],
      )),
    );
  }

  //自定义的appBar
  Widget _customAppBar() {
    return Positioned(
        left: 0,
        top: 0,
        right: 0,
        child: Obx(
          () => AppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(255, 255, 255,
                controller.ratio.value), //Colors.transparent=白色透明度为0
            elevation: 0,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  DoFontIcons.xiaomi,
                  color:
                      Color.fromRGBO(255, 255, 255, 1 - controller.ratio.value),
                )),
            leadingWidth: controller.flag.value ? 0 : 50,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.qr_code,
                    color:
                        controller.flag.value ? Colors.black87 : Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    DoFontIcons.message,
                    color:
                        controller.flag.value ? Colors.black87 : Colors.white,
                  )),
            ],
            title: AnimatedContainer(
              // curve: Curves.easeIn,
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: DoScreenAdapter.w(200 + controller.ratio.value * 50),
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
                  const Icon(
                    DoFontIcons.scan,
                    color: Colors.black26,
                    size: 20,
                  ),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       DoFontIcons.scan,
                  //       color: Colors.black26,
                  //     )),
                ],
              ),
            ),
          ),
        ));
  }

  //listView的内容区域
  Widget _contentListView() {
    return Positioned(
        top: -DoScreenAdapter.h(44),
        left: 0,
        right: 0,
        bottom: 0,
        child: ListView(controller: controller.scrollController, children: [
          _bannerSwiperArea(),
          _bannerImageArea(),
          _menuSwiperArea(),
          _sigleBannerArea(),
          _bestGoodsArea(),
          _goodsListView(),
        ]));
  }

  //顶部banner
  Widget _bannerSwiperArea() {
    return SizedBox(
      width: DoScreenAdapter.w(375),
      height: DoScreenAdapter.h(200),
      child: Obx(
        () => Swiper(
          autoplay: true,
          loop: true,
          itemCount: controller.bannerList.length,
          // duration: 3000,
          pagination: const SwiperPagination(builder: SwiperPagination.rect),
          // pagination: const RectSwiperPaginationBuilder(),
          itemBuilder: (context, index) {
            String picURL =
                "https://xiaomi.itying.com/${controller.bannerList[index].pic}";
            return Image.network(
              picURL.replaceAll("\\", "/"),
              // "https://www.itying.com/images/focus/focus02.png",
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }

  //固定banner图片
  Widget _bannerImageArea() {
    return SizedBox(
      width: DoScreenAdapter.sw(),
      height: DoScreenAdapter.h(20),
      child: Image.asset(
        "assets/images/xiaomiMenu.png",
        fit: BoxFit.cover,
      ),
    );
  }

  //菜单滚动区
  Widget _menuSwiperArea() {
    return SizedBox(
      // color: Colors.orange,
      width: DoScreenAdapter.w(375),
      height: DoScreenAdapter.h(160),
      child: Obx(
        () => Swiper(
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
                            activeColor: Colors.black54,
                          ).build(context, config),
                        ),
                      )
                    ],
                  ),
                );
              })),
          loop: false,
          itemCount: controller.categoryList.length ~/ 10, //取整
          itemBuilder: (context, index) {
            return GridView.builder(
              padding: EdgeInsets.all(DoScreenAdapter.w(10)),
              itemCount: 10, //代表一屏最多显示几个
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: DoScreenAdapter.w(25), //水平间距
                  mainAxisSpacing: DoScreenAdapter.h(5), //垂直间距
                  childAspectRatio:
                      0.6 //！！！！这个非常重要，默认是1，也就是item整体是宽高比1：1，感觉优先级比较高，
                  //下面单独设置的图片container的宽高都不生效, 这个值调高一些，就会出现bottom overflowed by 26 PIXELS的报错
                  ),
              itemBuilder: (context, i) {
                String picURL =
                    "https://xiaomi.itying.com/${controller.categoryList[i + 10 * index].pic}";
                return Column(
                  children: [
                    Container(
                      // padding: EdgeInsets.all(5),
                      // color: Colors.orange,
                      alignment: Alignment.center,
                      //下面两个完全可以不设置，因为上面有个ratio生效
                      // width: DoScreenAdapter.h(60),
                      // height: DoScreenAdapter.h(60),
                      child: Image.network(
                        // color: Colors.green,
                        picURL.replaceAll("\\", "/"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(
                      height: DoScreenAdapter.h(8),
                    ),
                    Text(
                      "${controller.categoryList[i + 10 * index].title}",
                      style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  //单一banner区域
  Widget _sigleBannerArea() {
    return Padding(
      padding: EdgeInsets.all(DoScreenAdapter.w(10)),
      child: Container(
        height: DoScreenAdapter.h(120),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DoScreenAdapter.w(10)),
            image: const DecorationImage(
              image: AssetImage("assets/images/xiaomiBanner.png"),
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  //热销臻选区域
  Widget _bestGoodsArea() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(DoScreenAdapter.w(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "热销臻选",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "更多手机推荐 ＞",
                style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black38),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: DoScreenAdapter.h(200),
          padding: EdgeInsets.fromLTRB(DoScreenAdapter.w(10), 0,
              DoScreenAdapter.w(10), DoScreenAdapter.w(10)),
          child: Row(
            children: [
              //左侧
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(DoScreenAdapter.w(30)),
                    color: const Color.fromRGBO(248, 248, 248, 1),
                  ),
                  child: Obx(
                    () => Swiper(
                      autoplay: true,
                      loop: true,
                      itemCount: controller.bestBannerList.length,
                      pagination: SwiperPagination(
                          margin: const EdgeInsets.all(0.0),
                          builder: SwiperCustomPagination(builder:
                              (BuildContext context,
                                  SwiperPluginConfig config) {
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
                                        activeColor: Colors.green,
                                      ).build(context, config),
                                    ),
                                  )
                                ],
                              ),
                            );
                          })),
                      itemBuilder: (context, index) {
                        String picURL =
                            "https://xiaomi.itying.com/${controller.bestBannerList[index].pic}";
                        return Image.network(
                          picURL.replaceAll("\\", "/"),
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: DoScreenAdapter.w(10),
              ),
              //右侧
              Expanded(
                flex: 1,
                child: Obx(
                  () => Column(
                    children:
                        controller.hotGoodsList.asMap().entries.map((entries) {
                      var element = entries.value;
                      String picURL =
                          "https://xiaomi.itying.com/${element.pic}";
                      return Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0,
                                entries.key == 2 ? 0 : DoScreenAdapter.h(5)),
                            padding: EdgeInsets.fromLTRB(
                                DoScreenAdapter.w(10),
                                DoScreenAdapter.h(0),
                                DoScreenAdapter.w(0),
                                DoScreenAdapter.h(0)),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(DoScreenAdapter.w(5)),
                              color: const Color.fromRGBO(248, 248, 248, 1),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${element.title}",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: DoScreenAdapter.h(5),
                                      ),
                                      Text("${element.subTitle}",
                                          style: const TextStyle(
                                            fontSize: 10,
                                          )),
                                      SizedBox(
                                        height: DoScreenAdapter.h(5),
                                      ),
                                      Text("¥${element.price}",
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Image.network(
                                    picURL.replaceAll("\\", "/"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  //瀑布流列表
  Widget _goodsListView() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(DoScreenAdapter.w(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "省心优惠",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "全部优惠 ＞",
                style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black38),
              ),
            ],
          ),
        ),
        Obx(() => Container(
              color: const Color.fromRGBO(242, 242, 242, 1),
              child: MasonryGridView.count(
                padding: EdgeInsets.all(DoScreenAdapter.w(10)),
                crossAxisCount: 2,
                mainAxisSpacing: DoScreenAdapter.w(10), //垂直间距
                crossAxisSpacing: DoScreenAdapter.h(10), //水平间距
                itemCount: controller.goodsList.length,
                shrinkWrap: true, //收缩，让子元素自适应宽度
                physics:
                    const NeverScrollableScrollPhysics(), //禁止自身滚动，让外面的listView滚动
                itemBuilder: (context, index) {
                  String picURL =
                      "https://xiaomi.itying.com/${controller.goodsList[index].sPic}";
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(DoScreenAdapter.w(5)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          // decoration: BoxDecoration(
                          // borderRadius: BorderRadius.,
                          // image: DecorationImage(
                          //     image: NetworkImage(
                          //         picURL.replaceAll("\\", "/")))),
                          padding: EdgeInsets.all(DoScreenAdapter.w(5)),
                          child: Image.network(
                            picURL.replaceAll("\\", "/"),
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
                  );
                },
              ),
            )),
      ],
    );
  }
}
