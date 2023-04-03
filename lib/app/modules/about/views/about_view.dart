import 'package:doxiaomimall/app/services/app_screenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/app_colors.dart';
import '../../../components/app_components.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoColors.gray249,
      appBar: AppBar(
        title: const Text('关于商城'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: [
            SizedBox(height: DoScreenAdapter.h(20)),
            SizedBox(
                width: DoScreenAdapter.w(50),
                height: DoScreenAdapter.w(50),
                child: Image.asset("assets/images/logo.png")),
            SizedBox(height: DoScreenAdapter.h(5)),
            Text(controller.versionNumber,
                style: TextStyle(
                    fontSize: DoScreenAdapter.fs(14), color: DoColors.gray168)),
            SizedBox(height: DoScreenAdapter.h(20)),
          ],
        ),
        commonListTile("了解小米", onTap: () {}),
        commonListTile("官方微博", onTap: () {}),
        commonListTile("廉洁小米", onTap: () {}),
        commonListTile("去打个分", onTap: () {}),
        commonListTile("APP分享", onTap: () {}),
        commonListTile("清除缓存", onTap: () {}),
        Container(
          padding: EdgeInsets.only(top: DoScreenAdapter.w(20)),
          alignment: Alignment.bottomCenter,
          child: Text("搜索黑科技，小米为发烧而生！",
              style: TextStyle(
                  fontSize: DoScreenAdapter.fs(14), color: DoColors.gray168)),
        ),
      ],
    );
  }
}
