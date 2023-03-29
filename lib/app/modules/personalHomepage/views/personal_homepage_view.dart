import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../services/app_screenAdapter.dart';
import '../controllers/personal_homepage_controller.dart';

class PersonalHomepageView extends GetView<PersonalHomepageController> {
  const PersonalHomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('个人主页'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("message");
              },
              icon: const Icon(
                Icons.notifications_none_outlined,
                // size: 20,
              ))
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Center(
          child: InkWell(
            // onTap: _changeAvatarBottomSheet,
            onTap: _showActionSheet,
            child: Obx(
              () => ClipOval(
                child: !controller.isHaveLocalAvatar.value
                    ? CircleAvatar(
                        radius: DoScreenAdapter.w(40),
                        backgroundImage:
                            const AssetImage("assets/images/avatar_man.png"),
                      )
                    : Image.file(
                        File(controller.avatarPath.value),
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
              ),
            ),
          ),
        ),
        const ListTile(title: Text("昵称")),
        const ListTile(
          title:
              Text("姓别", style: TextStyle(color: Colors.black, fontSize: 16)),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        const ListTile(
          title:
              Text("出生日期", style: TextStyle(color: Colors.black, fontSize: 16)),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );
  }

  ///iOS风格actionSheet
  void _showActionSheet() async {
    await showCupertinoModalPopup(
        context: Get.context!,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            // title: const Text(
            //   "温馨提示",
            // ),
            // message: const Text(
            //   "xxx",
            // ),
            actions: [
              // CupertinoActionSheetAction(
              //     onPressed: () {},
              //     child: const Text("CupertinoActionSheetAction")),
              TextButton(
                  onPressed: () {
                    Get.back();
                    _takeCamera();
                  },
                  child: const Text("拍照")),
              TextButton(
                  onPressed: () {
                    Get.back();
                    _imagePicker();
                  },
                  child: const Text("从手机相册选择")),
              TextButton(
                  onPressed: () {
                    Get.back();
                    // _saveImage(path);
                  },
                  child: const Text("保存图片"))
            ],
            cancelButton: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("取消")),
          );
        });
  }

  //更换头像事件-暂时没有用
  void _changeAvatarBottomSheet() async {
    var result = await showModalBottomSheet(
        context: Get.context!,
        builder: (context) {
          return SizedBox(
            height: 290,
            child: ListView(
              children: [
                ListTile(
                  onTap: (() {
                    _takeCamera();
                    Navigator.pop(context, "拍照");
                  }),
                  title: const Text("拍照"),
                ),
                const Divider(),
                ListTile(
                  onTap: (() {
                    _imagePicker();
                    Navigator.pop(context, "从手机相册选择");
                  }),
                  title: const Text("从手机相册选择"),
                ),
                const Divider(),
                ListTile(
                  onTap: (() {
                    // _saveImage();
                    Navigator.pop(context, "保存图片");
                  }),
                  title: const Text("保存图片"),
                ),
                Container(
                  height: 10,
                  color: const Color.fromARGB(255, 247, 245, 245),
                ),
                ListTile(
                  onTap: (() {
                    Navigator.pop(context, "取消");
                  }),
                  title: const Text("取消"),
                ),
              ],
            ),
          );
        });
    print(result);
  }

  ///拍照
  void _takeCamera() async {
    XFile? image =
        await controller.picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // print(image);
      // print(image.path);
      // _xFile = image;
      _saveImage(image.path);
    }
  }

  ///从相册选择图片
  void _imagePicker() async {
    XFile? image =
        await controller.picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // print(image);
      // print(image.path);
      // _xFile = image;
      _saveImage(image.path);
    }
  }

  ///保存图片
  void _saveImage(String path) {
    print("_saveImage");
    controller.savePhotoToLocal(path);
  }
}
