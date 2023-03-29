import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/app_components.dart';
import '../../../../models/address_model.dart';
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
        elevation: 0.2,
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
        bottom: DoScreenAdapter.adapterBottomH(),
        child: Obx(() => controller.addressList.isNotEmpty
            ? ListView.builder(
                itemCount: controller.addressList.length,
                itemBuilder: (context, index) {
                  return SwipeActionCell(
                    key: ValueKey(controller.addressList[index]),
                    trailingActions: [
                      SwipeAction(
                          onTap: (handler) {
                            controller.deleteAddress(
                                controller.addressList[index].sId!);
                          },
                          title: "删除",
                          style: TextStyle(
                              fontSize: DoScreenAdapter.fs(14),
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          widthSpace: DoScreenAdapter.w(50),
                          color: Colors.red),
                      controller.addressList[index].defaultAddress != 1
                          ? SwipeAction(
                              onTap: (handler) {
                                controller.modifyDefaultAddress(
                                    controller.addressList[index].sId!);
                              },
                              title: "设为默认",
                              style: TextStyle(
                                  fontSize: DoScreenAdapter.fs(14),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              color: DoColors.gray186)
                          : SwipeAction(onTap: (handler) {}, widthSpace: 0),
                    ],
                    child: _addressItem(controller.addressList[index]),
                  );
                },
              )
            // ListView(
            //     children: controller.addressList
            //         .map((element) => _addressItem(element))
            //         .toList())
            : commonEmptyView("您还没有添加地址")));
  }

  Widget _floatingButton() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: InkWell(
          onTap: () {
            Get.toNamed("/address-create")!
                .then((value) => controller.requestAddressList());
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(width: 1, color: DoColors.gray238)),
            ),
            height: DoScreenAdapter.adapterBottomH(),
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
    String fullAddress = element.address!;
    List list = fullAddress.split(" ");
    String addressDistrict = "${list[0]} ${list[1]} ${list[2]}";
    list.removeRange(0, 3);
    String addressDetail = list.join(" ");

    return InkWell(
      onTap: () {
        print(element);
        Get.toNamed("/address-modify", arguments: {
          "sId": element.sId,
          "name": element.name,
          "phone": element.phone,
          "address": element.address,
        })!
            .then((value) => controller.requestAddressList());
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
                        addressDistrict,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: DoScreenAdapter.fs(14),
                        ),
                      ),
                      SizedBox(height: DoScreenAdapter.h(2)),
                      Text(
                        addressDetail,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
