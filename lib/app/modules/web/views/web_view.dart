import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../services/app_colors.dart';
import '../controllers/web_controller.dart';

class WebView extends GetView<WebController> {
  const WebView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Obx(() => controller.isLoadFinished.value
        ? WebViewWidget(controller: controller.webVC)
        : LinearProgressIndicator(
            backgroundColor: DoColors.theme.withOpacity(0.3),
            color: DoColors.theme,
          ));
  }
}
