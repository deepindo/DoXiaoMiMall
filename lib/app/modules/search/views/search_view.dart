import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      appBar: _customAppBar(),
      body: _contentListView(),
    );
  }

  /// 自定义的appBar
  AppBar _customAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
      elevation: 0,
      title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: DoScreenAdapter.w(300),
          height: DoScreenAdapter.h(26),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            autofocus: true,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: const Icon(
                Icons.search,
                // color: Colors.black54,
              ),
              // prefixText: "xxxx",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
            ),
          )),
      actions: [
        TextButton(
            onPressed: () {
              Get.offAndToNamed("/goods-list");
              // Get.offAllNamed("/goods-list");
            },
            child: const Text(
              "搜索",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            )),
      ],
    );
  }

  /// 列表内容区
  ///!!!ListView中添加的子控件，自动会居中，比如本页中的wrapView就会受到影响
  Widget _contentListView() {
    return ListView(
      padding: EdgeInsets.all(DoScreenAdapter.w(10)),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "搜索历史",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.black54,
                )),
          ],
        ),
        _searchHistoryWrapView(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "猜你想搜",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.black54,
                )),
          ],
        ),
        _maybeWrapView(),
        SizedBox(
          height: DoScreenAdapter.h(20),
        ),
        _hotGridView()
      ],
    );
  }

  ///搜素历史
  Widget _searchHistoryWrapView() {
    return Wrap(
      spacing: DoScreenAdapter.w(10),
      // runSpacing: DoScreenAdapter.w(3),
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "手机",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }

  ///猜你想搜
  Widget _maybeWrapView() {
    return Wrap(
      spacing: DoScreenAdapter.w(10), //水平
      runSpacing: DoScreenAdapter.w(10), //垂直
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "手机",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "MAC",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "MAC",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "MAC",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "MAC",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "MAC",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "MACeeeeeee",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "MACxxxxxx",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "MACaaagg g",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoScreenAdapter.w(5))),
          // margin: EdgeInsets.all(DoScreenAdapter.w(10)),
          padding: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5),
              DoScreenAdapter.w(10),
              DoScreenAdapter.h(5)),
          child: const Text(
            "MAC11313",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }

  ///小米搜索
  Widget _hotGridView() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: DoScreenAdapter.h(40),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/hot_search.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.all(DoScreenAdapter.w(5)),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 3 / 1),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        // color: Colors.orange,
                        alignment: Alignment.center,
                        width: DoScreenAdapter.w(70),
                        // height: DoScreenAdapter.h(80),
                        padding: EdgeInsets.all(DoScreenAdapter.w(5)),
                        child: Image.network(
                          "https://www.itying.com/images/shouji.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(DoScreenAdapter.w(5)),
                        child: Text(
                          "小米净化器 热水器 小米净化器",
                          style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                        ),
                      )),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
