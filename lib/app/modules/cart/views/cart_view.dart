import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/app_screenAdapter.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView {
  ///商品详情页也要跳转购物车，加上tabs里面是懒加载cartController，
  ///所以去掉懒加载依赖，改为在cartView的put，以实现效果
  @override
  final CartController controller = Get.put(CartController());
  CartView({Key? key}) : super(key: key);
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
      title: Text(
        '购物车',
        style: TextStyle(
          fontSize: DoScreenAdapter.fs(16),
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
      elevation: 0,
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              "编辑",
              style: TextStyle(
                fontSize: DoScreenAdapter.fs(14),
                color: Colors.black87,
              ),
            )),
      ],
    );
  }

  ///body部分
  Widget _body() {
    return ListView(
      padding: EdgeInsets.all(DoScreenAdapter.w(10)),
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DoScreenAdapter.w(10)),
            color: Colors.white,
          ),
          child: Row(children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                        width: DoScreenAdapter.w(60),
                        height: DoScreenAdapter.w(60),
                        child: Image.network("")),
                    Column(
                      children: [
                        Text("小米"),
                        ActionChip(label: Text("黑色")),
                        Row(
                          children: [
                            Text("￥2999"),
                            Text("- 1 + "),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ]),
        )
      ],
    );
  }
}
