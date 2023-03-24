import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/goods_content_controller.dart';
import '../../../services/app_network.dart';
import 'goods_content_view.dart';

class GoodsContentRecommendView extends GetView {
  @override
  final GoodsContentController controller = Get.find();

  GoodsContentRecommendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      // color: Colors.cyan,
      width: double.infinity,
      child: Column(
        children: [
          _goodsListView(),
          SizedBox(
            height: DoScreenAdapter.h(20),
          ),
        ],
      ),
    );
  }

  ///推荐瀑布流列表
  Widget _goodsListView() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(DoScreenAdapter.w(10)),
          child: const Text(
            "猜你喜欢",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Obx(() => Container(
              color: const Color.fromRGBO(248, 248, 248, 1),
              child: MasonryGridView.count(
                padding: EdgeInsets.all(DoScreenAdapter.w(10)),
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
                      ///商品详情中的商品列表再进商品详情？
                      ///怎么解决
                      print("商品详情中的商品列表再进商品详情？");

                      //直接用page跳转也不行
                      // Get.to(GoodsContentView(
                      //     key: ValueKey(controller.goodsList[index].sId)));

                      ///下面代码不会执行的，可能是get原因，可能是flutter原因
                      ///如何实例化出新的页面，不与当前页面共享就没有问题了
                      // Get.toNamed(
                      //     "/goods-content?sid=${controller.goodsList[index].sId}");
                      /*
                      Get.toNamed("/goods-content", arguments: {
                        "sid": controller.goodsList[index].sId,
                        "isCanJumpCart": true
                      });
                      */
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(DoScreenAdapter.w(5)),
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
              ),
            )),
      ],
    );
  }
}
