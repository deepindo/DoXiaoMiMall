import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
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
      actions: [
        TextButton(
            onPressed: () {
              Get.offAndToNamed("/goods-list");
              // Get.offAllNamed("/goods-list");
            },
            child: Text(
              "搜索",
              style: TextStyle(fontSize: 14),
            )),
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         DoFontIcons.message,
        //         color: Colors.black87,
        //       )),
      ],
      title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: DoScreenAdapter.w(300),
          height: DoScreenAdapter.h(26),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              prefixText: "xxxx",
            ),
          )),
    );
  }

  Widget _contentListView() {
    return ListView(
      children: [_searchHistoryWrapView(), _maybeWrapView(), _hotGridView()],
    );
  }

  Widget _searchHistoryWrapView() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("搜索历史"),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever)),
            ],
          ),
          Wrap(
            children: [
              Container(
                child: Text("手机"),
              ),
              Container(
                child: Text("洗衣机"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _maybeWrapView() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("猜你想搜"),
              IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
            ],
          ),
          Wrap(
            children: [
              Container(
                child: Text("手机"),
              ),
              Container(
                child: Text("洗衣机"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _hotGridView() {
    return Container(
        child: GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 3),
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              child: Image.network(""),
            ),
            Text("data"),
          ],
        );
      },
    ));
  }
}
