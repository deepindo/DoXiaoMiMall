import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../controllers/address_manager_controller.dart';

class AddressManagerView extends GetView<AddressManagerController> {
  const AddressManagerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('地址管理'),
        centerTitle: true,
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
          color: Colors.cyan,
          height: DoScreenAdapter.h(40),
          child: Container(
            decoration: BoxDecoration(),
          ),
        ));
  }

  Widget _addressItem() {
    return InkWell(
      onTap: () {
        Get.toNamed("/address-modify");
      },
      child: Container(
        // height: DoScreenAdapter.h(50),
        padding: EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "xxxx",
                      // "${controller.model.value.username}",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: DoScreenAdapter.w(10)),
                    Text(
                      "17623458080",
                      // "${controller.model.value.username}",
                      style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: DoScreenAdapter.h(5)),
                Text(
                  "xxxx",
                  // "${controller.model.value.username}",
                  style: TextStyle(
                      fontSize: DoScreenAdapter.fs(14),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: DoScreenAdapter.h(5)),
                Text(
                  "xxxx",
                  // "${controller.model.value.username}",
                  style: TextStyle(
                      fontSize: DoScreenAdapter.fs(14),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.arrow_forward_ios_outlined,
                    size: DoScreenAdapter.fs(12), color: DoColors.black128)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
