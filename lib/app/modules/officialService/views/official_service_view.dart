import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/official_service_controller.dart';

class OfficialServiceView extends GetView<OfficialServiceController> {
  const OfficialServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '官网服务',
          style: TextStyle(
              fontSize: DoScreenAdapter.fs(16), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black87,
              )),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView.builder(
      itemCount: controller.serviceList.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return Container(
            // height: DoScreenAdapter.h(150),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(DoScreenAdapter.w(10))),
            child: Column(
              children: [
                Text(
                  controller.serviceList[i]["title"],
                  style: TextStyle(fontSize: 12),
                ),
                // GridView.builder(
                //   padding: EdgeInsets.all(DoScreenAdapter.w(10)),
                //   itemCount: controller.serviceList[i]["list"].length,
                //   // scrollDirection: Axis.horizontal,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       mainAxisSpacing: DoScreenAdapter.w(10),
                //       crossAxisSpacing: DoScreenAdapter.w(10),
                //       childAspectRatio: 1),
                //   itemBuilder: (context, index) {
                //     return InkWell(
                //       onTap: () {
                //         print("点了。。。");
                //         print(
                //             controller.serviceList[i]["list"][index]["title"]);

                //         ///使用唯一的标识符，因为名称和图标有可能更换
                //       },
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Icon(
                //             controller.serviceList[i]["list"][index]["icon"],
                //             color: controller.serviceList[i]["list"][index]
                //                 ["color"],
                //           ),
                //           SizedBox(
                //             height: DoScreenAdapter.h(10),
                //           ),
                //           Text(
                //             controller.serviceList[i]["list"][index]["title"],
                //             style: TextStyle(fontSize: DoScreenAdapter.fs(12)),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // ),
              ],
            ));
      },
    );
  }
}
