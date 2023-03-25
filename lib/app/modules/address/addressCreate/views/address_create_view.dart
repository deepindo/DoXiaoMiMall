import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: ListView(children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("姓名:"),
                    TextFormField(
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      controller: controller.usernameController,
                      keyboardType: TextInputType.name,
                      cursorColor: DoColors.theme,
                      style: TextStyle(
                          color: DoColors.black0,
                          fontSize: DoScreenAdapter.fs(16),
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
                        ),
                        suffixIcon: InkWell(
                            onTap: () {
                              // controller.usernameController.text = "";
                            },
                            child: Icon(Icons.contact_phone_outlined,
                                size: DoScreenAdapter.fs(18))),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 0.5, color: DoColors.gray238)
              ],
            ),
          )
        ]));
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
        ));
  }
}
