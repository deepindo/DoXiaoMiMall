import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutController extends GetxController {
  RxString versionNumber = "".obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    readPackageInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void readPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    print("appName:$appName");
    print("packageName:$packageName");
    print("version:$version");
    print("buildNumber:$buildNumber");
    versionNumber.value = version;
    update();
  }
}
