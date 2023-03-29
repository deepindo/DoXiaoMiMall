import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class ThemeView extends GetView<ThemeController> {
  const ThemeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('主题选择'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: 5,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1,
      children: controller.themeColorList.map((e) {
        return InkWell(
          onTap: () {
            Get.changeTheme(ThemeData(
                appBarTheme: AppBarTheme(backgroundColor: e),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    // 文字颜色
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.white;
                      } else {
                        return null;
                      }
                    }),
                    // 背景色
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return e.withOpacity(0.5);
                      } else {
                        return e;
                      }
                    }),
                  ),
                )));
          },
          child: Container(color: e),
        );
      }).toList(),
    );
  }
}
