import 'package:doxiaomimall/app/services/app_screenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
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
    return Container(
      // color: Colors.orange,
      width: DoScreenAdapter.w(375),
      height: DoScreenAdapter.h(170),
      child: Obx(
        () => Swiper(
          pagination: SwiperPagination(
              margin: const EdgeInsets.all(0.0),
              builder: SwiperCustomPagination(
                  builder: (BuildContext context, SwiperPluginConfig config) {
                return ConstrainedBox(
                  constraints: BoxConstraints.expand(
                      height: DoScreenAdapter.h(10)), //隔底部的间距
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
          loop: false,
          itemCount: controller.categoryList.length ~/ 10, //取整
          itemBuilder: (context, index) {
            return GridView.builder(
              padding: EdgeInsets.all(DoScreenAdapter.w(10)),
              itemCount: 10, //代表一屏最多显示几个
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: DoScreenAdapter.w(18), //水平间距
                  mainAxisSpacing: DoScreenAdapter.h(5), //垂直间距
                  childAspectRatio:
                      0.6 //！！！！这个非常重要，默认是1，也就是item整体是宽高比1：1，感觉优先级比较高，下面单独设置的图片container的宽高都不生效
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
}
