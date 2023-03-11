import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';
import 'package:doxiaomimall/app/services/app_screenAdapter.dart';
import '../../../services/app_fontIcons.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: Row(
        children: [_leftListView(), _rightGridView()],
      ),
    );
  }

  //自定义的appBar
  AppBar _customAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              DoFontIcons.message,
              color: Colors.black87,
            )),
      ],
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: DoScreenAdapter.w(300),
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
          ],
        ),
      ),
    );
  }

  Widget _leftListView() {
    return Container(
      // color: Colors.cyan,
      width: DoScreenAdapter.w(90),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Obx(
            () => InkWell(
              onTap: () {
                // controller.currentIndex.value = index;
                controller.changeIndex(index);
              },
              child: SizedBox(
                height: DoScreenAdapter.h(50),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: DoScreenAdapter.w(5),
                      height: DoScreenAdapter.h(10),
                      color: controller.selectIndex.value == index
                          ? Colors.orange
                          : Colors.white,
                    ),
                    Center(child: Text("${index}")),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _rightGridView() {
    return Expanded(
        child: Container(
      // color: Colors.orange,
      child: GridView.builder(
        itemCount: 40,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: DoScreenAdapter.w(10),
            crossAxisSpacing: DoScreenAdapter.w(0),
            childAspectRatio: 0.6),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(DoScreenAdapter.w(10)),
                child: Image.network(
                  "https://www.itying.com/images/b_focus01.png",
                  fit: BoxFit.cover,
                ),
              ),
              Text("data"),
            ],
          );
        },
      ),
    ));
  }
}
