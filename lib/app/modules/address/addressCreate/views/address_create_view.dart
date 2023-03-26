import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:city_pickers/city_pickers.dart';
import '../../../../models/response_model.dart';
import '../../../../services/app_colors.dart';
import '../../../../services/app_screenAdapter.dart';
import '../controllers/address_create_controller.dart';

class AddressCreateView extends GetView<AddressCreateController> {
  const AddressCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoColors.gray249,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('新建地址'),
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
        child: ListView(
            padding: EdgeInsets.only(top: DoScreenAdapter.h(5)),
            children: [
              ///姓名
              Container(
                // height: DoScreenAdapter.h(41.5),
                padding:
                    EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("姓名:"),
                        SizedBox(width: DoScreenAdapter.w(5)),
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {},
                            onFieldSubmitted: (value) {},
                            validator: (value) {
                              // print("validator:$value");
                              return value!.trim().isNotEmpty ? null : "姓名不能为空";
                            },
                            controller: controller.usernameController,
                            keyboardType: TextInputType.name,
                            cursorColor: DoColors.theme,
                            textAlignVertical: TextAlignVertical
                                .center, //有suffixIcon图标的时候，只设置这一个就可以垂直方向居中
                            style: TextStyle(
                                color: DoColors.black0,
                                fontSize: DoScreenAdapter.fs(14),
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // prefix: Text("姓名1:"),
                              // prefixText: "姓名",
                              // label: Text("姓名:"),
                              // helperText: "help",
                              hintText: "填写收货人姓名",
                              hintStyle: TextStyle(
                                  color: DoColors.gray168,
                                  fontSize: DoScreenAdapter.fs(14),
                                  fontWeight: FontWeight.normal),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    Get.snackbar("操作", "打开通讯录");
                                  },
                                  child: Icon(Icons.contact_phone_outlined,
                                      size: DoScreenAdapter.fs(18))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 0.5, color: DoColors.gray154)
                  ],
                ),
              ),

              ///电话-通过设置高度，上下与分隔线用了Expanded,左右与左边文字间也用了Expanded
              ///这样方便控制高度，另外不用设置空的suffixIcon来达到居中的效果
              Container(
                height: DoScreenAdapter.h(41.5),
                padding:
                    EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Text("电话:"),
                          SizedBox(width: DoScreenAdapter.w(5)),
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                print("validator:$value");
                              },
                              controller: controller.phoneController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(11)
                              ],
                              keyboardType: TextInputType.number,
                              cursorColor: DoColors.theme,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: DoColors.black0,
                                  fontSize: DoScreenAdapter.fs(14),
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  isCollapsed: true,
                                  // contentPadding:
                                  //     const EdgeInsets.only(top: 0, bottom: 0),
                                  // focusedBorder: const OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //   style: BorderStyle.none,
                                  // )),
                                  // enabledBorder: const OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //   style: BorderStyle.none,
                                  // )),
                                  // border: const OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //   style: BorderStyle.none,
                                  // )),
                                  border: InputBorder.none,
                                  hintText: "填写收货人手机号",
                                  hintStyle: TextStyle(
                                      color: DoColors.gray168,
                                      fontSize: DoScreenAdapter.fs(14),
                                      fontWeight:
                                          FontWeight.normal) //这个不设置就会受上面设置的影响),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 0.5, color: DoColors.gray154)
                  ],
                ),
              ),
              Container(height: DoScreenAdapter.h(5), color: DoColors.gray238),

              ///所在地区-使用纯文本实现的
              /*
              Container(
                height: DoScreenAdapter.h(41.5),
                padding:
                    EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Text("所在地区:"),
                          SizedBox(width: DoScreenAdapter.w(5)),
                          Expanded(
                              child: Text(
                            "选择地区信息",
                            style: TextStyle(
                              color: DoColors.gray168,
                              fontSize: DoScreenAdapter.fs(14),
                            ),
                          )),
                        ],
                      ),
                    ),
                    const Divider(height: 0.5, color: DoColors.gray154)
                  ],
                ),
              ),
              */
              ///所在地区-使用输入框实现的
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("所在地区:"),
                        SizedBox(width: DoScreenAdapter.w(5)),
                        Expanded(
                          child: TextFormField(
                              onTap: () async {
                                Result? result =
                                    await CityPickers.showCityPicker(
                                        context: Get.context!);
                                // print(result);
                                if (result != null) {
                                  controller.addressDistrictController.text =
                                      "${result.provinceName} ${result.cityName} ${result.areaName}";
                                }
                              },
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                print("validator:$value");
                              },
                              controller: controller.addressDistrictController,
                              keyboardType: TextInputType.text,
                              cursorColor: DoColors.theme,
                              textAlignVertical: TextAlignVertical.center,
                              // enabled: false,
                              // enableInteractiveSelection: true,
                              style: TextStyle(
                                  color: DoColors.black0,
                                  fontSize: DoScreenAdapter.fs(14),
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "选择地区信息",
                                  hintStyle: TextStyle(
                                      color: DoColors.gray168,
                                      fontSize: DoScreenAdapter.fs(14),
                                      fontWeight: FontWeight.normal),
                                  suffixIcon: const Text(""))),
                        ),
                      ],
                    ),
                    const Divider(height: 0.5, color: DoColors.gray154)
                  ],
                ),
              ),

              ///详细地址-isCollapsed
              /*
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("详细地址:"),
                        SizedBox(width: DoScreenAdapter.w(5)),
                        Expanded(
                          child: TextFormField(
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                print("validator:$value");
                              },
                              controller: controller.addressDetailController,
                              keyboardType: TextInputType.name,
                              cursorColor: DoColors.theme,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: DoColors.black0,
                                  fontSize: DoScreenAdapter.fs(16),
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "小区、楼牌号等",
                                  hintStyle: TextStyle(
                                      color: DoColors.gray168,
                                      fontSize: DoScreenAdapter.fs(14),
                                      fontWeight: FontWeight.normal),
                                  suffixIcon: const Text(""))),
                        ),
                      ],
                    ),
                    const Divider(height: 0.5, color: DoColors.gray154)
                  ],
                ),
              ),
              */
              Container(
                height: DoScreenAdapter.h(41.5),
                padding:
                    EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Text("详细地址:"),
                          SizedBox(width: DoScreenAdapter.w(5)),
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                print("validator:$value");
                              },
                              controller: controller.addressDetailController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(11)
                              ],
                              keyboardType: TextInputType.text,
                              cursorColor: DoColors.theme,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: DoColors.black0,
                                  fontSize: DoScreenAdapter.fs(14),
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  isCollapsed: true,
                                  border: InputBorder.none,
                                  hintText: "小区、楼牌号等",
                                  hintStyle: TextStyle(
                                      color: DoColors.gray168,
                                      fontSize: DoScreenAdapter.fs(14),
                                      fontWeight:
                                          FontWeight.normal) //这个不设置就会受上面设置的影响),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 0.5, color: DoColors.gray154)
                  ],
                ),
              ),

              ///粘帖框
              Obx(() => controller.isAddressPasteUnfold.value
                  ? Container(
                      padding: EdgeInsets.all(DoScreenAdapter.w(10)),
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        controller: controller.pasteController,
                        maxLines: 4,
                        style: TextStyle(
                            color: DoColors.black0,
                            fontSize: DoScreenAdapter.fs(14),
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: DoColors.gray238,
                          contentPadding: EdgeInsets.all(DoScreenAdapter.w(6)),

                          ///以下三个都设置了，border才能去掉
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(DoScreenAdapter.w(5)),
                              borderSide: const BorderSide(
                                style: BorderStyle.none,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(DoScreenAdapter.w(5)),
                              borderSide: const BorderSide(
                                style: BorderStyle.none,
                              )),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(DoScreenAdapter.w(5)),
                              borderSide: const BorderSide(
                                style: BorderStyle.none,
                              )),
                          hintText: "粘帖文本，可自动识别姓名、电话和地址",
                          hintStyle: TextStyle(
                              color: DoColors.gray168,
                              fontSize: DoScreenAdapter.fs(14),
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    )
                  : const SizedBox(height: 0)),

              ///地址粘帖板
              InkWell(
                onTap: () {
                  // Clipboard.setData(ClipboardData(text: "code"));
                  controller.changeAddressPasteState();
                },
                child: Container(
                  height: DoScreenAdapter.h(30),
                  padding:
                      EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("地址粘贴板",
                          style: TextStyle(
                              fontSize: DoScreenAdapter.fs(12),
                              color: DoColors.gray154)),
                      SizedBox(width: DoScreenAdapter.w(5)),
                      Icon(Icons.keyboard_arrow_up_outlined,
                          size: DoScreenAdapter.fs(16), color: DoColors.gray154)
                    ],
                  ),
                ),
              ),
              Container(height: DoScreenAdapter.h(5), color: DoColors.gray238),

              ///默认地址
              Container(
                height: DoScreenAdapter.h(41.5),
                padding:
                    EdgeInsets.symmetric(horizontal: DoScreenAdapter.w(10)),
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "设为默认地址",
                                style: TextStyle(
                                    fontSize: DoScreenAdapter.fs(14),
                                    color: DoColors.black51),
                              ),
                              Text(
                                "提醒:每次下单都会默认推荐使用该地址",
                                style: TextStyle(
                                    fontSize: DoScreenAdapter.fs(12),
                                    color: DoColors.gray154),
                              ),
                            ],
                          ),
                          Obx(
                            () => CupertinoSwitch(
                              value: controller.isAddressDefault.value,
                              activeColor: DoColors.theme,
                              trackColor: DoColors.gray238,
                              thumbColor: Colors.white,
                              onChanged: (value) {
                                controller.switchDefault();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 0.5, color: DoColors.gray238)
                  ],
                ),
              ),
            ]));
  }

  Widget _floatingButton() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: InkWell(
          onTap: () async {
            if (controller.usernameController.text.isEmpty) {
              EasyLoading.showToast("请填写完整的姓名");
            } else if (!GetUtils.isPhoneNumber(
                    controller.phoneController.text) ||
                controller.phoneController.text.length != 11) {
              EasyLoading.showToast("请填写正确的手机号");
            } else if (controller.addressDistrictController.text.length < 2) {
              EasyLoading.showToast("请选择地区");
            } else if (controller.addressDetailController.text.length < 2) {
              EasyLoading.showToast("请填写详细地址");
            } else {
              FocusScope.of(Get.context!).requestFocus(FocusNode());
              controller.createAddress();
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(width: 1, color: DoColors.gray238)),
            ),
            height: (DoScreenAdapter.tabBarH() + DoScreenAdapter.bottomH()),
            child: Container(
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
              child: Text(
                "保存地址",
                style: TextStyle(
                    color: Colors.white, fontSize: DoScreenAdapter.fs(13)),
              ),
            ),
          ),
        ));
  }
}
