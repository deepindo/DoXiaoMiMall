import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../controllers/address_modify_controller.dart';

class AddressModifyView extends GetView<AddressModifyController> {
  const AddressModifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoColors.gray249,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('修改地址'),
        centerTitle: true,
        actions: [TextButton(onPressed: () {}, child: Text("删除"))],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(children: [_listView(), _floatingButton()]);
  }

  Widget _listView() {
    return Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: DoScreenAdapter.h(40),
        child: ListView(children: [_addressItem(), _addressItem()]));
  }

  Widget _floatingButton() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(width: 1, color: DoColors.gray238)),
          ),
          height: (DoScreenAdapter.tabBarH() + DoScreenAdapter.h(34)),
          child: Container(
            margin: EdgeInsets.fromLTRB(
              DoScreenAdapter.w(20),
              DoScreenAdapter.h(10),
              DoScreenAdapter.w(20),
              DoScreenAdapter.h(34) + DoScreenAdapter.h(10),
            ),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [DoColors.redBegin, DoColors.redEnd]),
                borderRadius: BorderRadius.circular(DoScreenAdapter.w(20))),
            alignment: Alignment.center,
            child: Text(
              "保存地址",
              style: TextStyle(
                  color: Colors.white, fontSize: DoScreenAdapter.fs(13)),
            ),
          ),
        ));
  }

  Widget _addressItem() {
    return InkWell(
      onTap: () {
        Get.toNamed("/address-modify");
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(DoScreenAdapter.w(10),
            DoScreenAdapter.h(10), DoScreenAdapter.w(10), DoScreenAdapter.h(0)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "xxxx",
                            // "${controller.model.value.username}",
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(16),
                                color: DoColors.theme),
                          ),
                          SizedBox(width: DoScreenAdapter.w(20)),
                          Text(
                            "17623458080",
                            // "${controller.model.value.username}",
                            style: TextStyle(
                              fontSize: DoScreenAdapter.fs(14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: DoScreenAdapter.h(2)),
                      Text(
                        "streetxxx悄葙fsflk枯叶基加油 因果报应劳而无功我啊x枯叶基加油 因果报应劳而无功我啊",
                        // "${controller.model.value.username}",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                        ),
                      ),
                      SizedBox(height: DoScreenAdapter.h(2)),
                      Text(
                        "detailxxxxx悄葙fsflk枯叶基加油 因果报应劳而无功我啊xxx悄葙fsflk枯叶基加油 因果报应劳而无功我啊xxx悄葙fsflk枯叶基加油 因果报应劳而无功我啊xxx悄葙fsflk枯叶基加油 因果报应劳而无功我啊xxx悄葙fsflk枯叶基加油 因果报应劳而无功我啊xxx悄葙fsflk枯叶基加油 因果报应劳而无功我啊",
                        // "${controller.model.value.username}",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: DoScreenAdapter.w(10)),
                Row(
                  children: [
                    Icon(Icons.arrow_forward_ios_outlined,
                        size: DoScreenAdapter.fs(12), color: DoColors.black128)
                  ],
                ),
              ],
            ),
            SizedBox(height: DoScreenAdapter.h(10)),
            const Divider(height: 0.5, color: DoColors.gray238)
          ],
        ),
      ),
    );
  }
}
