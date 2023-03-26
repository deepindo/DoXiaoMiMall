import 'package:doxiaomimall/app/models/address_model.dart';
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
      backgroundColor: DoColors.gray249,
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
        bottom: (DoScreenAdapter.tabBarH() + DoScreenAdapter.bottomH()),
        child: Obx(() => controller.addressList.isNotEmpty
            ? ListView(
                children: controller.addressList
                    .map((element) => _addressItem(element))
                    .toList())
            : const Text("暂无数据")));
  }

  Widget _floatingButton() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: InkWell(
          onTap: () {
            Get.toNamed("/address-create");
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(width: 1, color: DoColors.gray238)),
            ),
            height: (DoScreenAdapter.tabBarH() + DoScreenAdapter.bottomH()),
            child: Container(
              // height: DoScreenAdapter.h(39),
              margin: EdgeInsets.fromLTRB(
                DoScreenAdapter.w(20),
                DoScreenAdapter.h(10),
                DoScreenAdapter.w(20),
                DoScreenAdapter.h(10) + DoScreenAdapter.bottomH(),
              ),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [DoColors.redBegin, DoColors.redEnd]),
                  borderRadius: BorderRadius.circular(DoScreenAdapter.w(20))),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: DoScreenAdapter.fs(15),
                  ),
                  Text(
                    "新建收货地址",
                    style: TextStyle(
                        color: Colors.white, fontSize: DoScreenAdapter.fs(13)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _addressItem(AddressItemModel element) {
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
                            element.name!,
                            style: TextStyle(
                                fontSize: DoScreenAdapter.fs(16),
                                color: DoColors.theme),
                          ),
                          SizedBox(width: DoScreenAdapter.w(20)),
                          Text(
                            element.phone!,
                            style: TextStyle(
                              fontSize: DoScreenAdapter.fs(14),
                            ),
                          ),
                          SizedBox(width: DoScreenAdapter.w(10)),
                          element.defaultAddress == 1
                              ? Container(
                                  padding: EdgeInsets.all(DoScreenAdapter.w(2)),
                                  decoration: BoxDecoration(
                                      color: DoColors.theme,
                                      borderRadius: BorderRadius.circular(
                                          DoScreenAdapter.w(2))),
                                  child: Text(
                                    "默认",
                                    style: TextStyle(
                                        fontSize: DoScreenAdapter.fs(10),
                                        color: Colors.white),
                                  ),
                                )
                              : const Text(""),
                        ],
                      ),
                      SizedBox(height: DoScreenAdapter.h(2)),
                      Text(
                        element.address!,
                        // "${controller.model.value.username}",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                        ),
                      ),
                      SizedBox(height: DoScreenAdapter.h(2)),
                      Text(
                        element.address!,
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
