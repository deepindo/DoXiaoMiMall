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
      child: ListView(
        controller: controller.scrollController,
        children: [
          Container(
            width: DoScreenAdapter.w(375),
            height: DoScreenAdapter.h(200),
            child: Obx(
              () => Swiper(
                autoplay: true,
                loop: true,
                itemCount: controller.bannerList.value.length,
                // duration: 3000,
                pagination: SwiperPagination(builder: SwiperPagination.rect),
                // pagination: const RectSwiperPaginationBuilder(),
                itemBuilder: (context, index) {
                  String picURL =
                      "https://xiaomi.itying.com/${controller.bannerList[index]["pic"]}";
                  return Image.network(
                    picURL.replaceAll("\\", "/"),
                    // "https://www.itying.com/images/focus/focus02.png",
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ),
          ListTile(
            title: Text("144441"),
          ),
          ListTile(
            title: Text("144441"),
          ),
          ListTile(
            title: Text("144441"),
          ),
          ListTile(
            title: Text("144441"),
          ),
          ListTile(
            title: Text("144441"),
          ),
          ListTile(
            title: Text("144441"),
          ),
          ListTile(
            title: Text("144441"),
          ),
          ListTile(
            title: Text("144441"),
          ),
          ListTile(
            title: Text("144441"),
          ),
          ListTile(
            title: Text("144441"),
          ),
          ListTile(
            title: Text("144441"),
          ),
        ],
      ),
    );
  }
}
