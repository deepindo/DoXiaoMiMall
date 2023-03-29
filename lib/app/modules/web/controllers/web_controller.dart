import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebController extends GetxController {
  String url = Get.arguments != null
      ? Get.arguments["url"]
      : "https://www.baidu.com/"; //传递过来
  RxBool isLoadFinished = false.obs;
  late WebViewController webVC;

  @override
  void onInit() {
    super.onInit();
    initWebVC();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initWebVC() {
    webVC = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          print(progress);
          // Update loading bar.
          // _indicator.value = progress;
        },
        onPageStarted: (url) {},
        onPageFinished: (url) {
          // isLoadFinished.value = true;
          // update();
          changeWebViewState();
        },
        onWebResourceError: (error) {},
        onNavigationRequest: (request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(url));
  }

  void changeWebViewState() {
    isLoadFinished.value = true;
    update();
  }
}
